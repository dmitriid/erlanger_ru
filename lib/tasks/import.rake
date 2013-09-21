@offset = 1
namespace :import do
  desc "Import old Zootnic data"
  task :old, [:dir] => :environment do |t, args|
    raise 'No directory supplied' if args.dir.nil?

    puts "Reading #{args.dir}..."

    full_contents = {:lookups => {}}

    Dir.foreach(args.dir) do |item|
      next if item == '.' or item == '..'

      data = File.read("#{args.dir}/#{item}")
      json = ActiveSupport::JSON.decode(data)
      full_contents[json['id'].to_s] = json
    end

    full_contents.each do |id, item|
      next if item['rsc'].nil?
      # skip categories, we don't need them with our setup
      next if not item['category'].nil?
      # skip media items, this way we lose two or three photos, who cares?
      # 'medium' items will be used to supply html for
      # <-- z_media ... --> items
      next if not item['medium'].nil?

      create_resource(item, full_contents)
    end

  end
end

def create_resource(item, full_contents)
  return if item.nil?
  id = item['id']

  log "Creating #{id}"

  # rails behaves weirdly, so we cache newly created resources in lookup
  # instead of doing Resource.find(id) etc. Saves us from hitting the DB anyhow
  resource = full_contents[:lookups][id.to_s]
  unless resource.nil?
    log 'Already created'
    return resource
  end

  rsc = item['rsc']

  category = map_category(rsc['category_id'], full_contents)
  if category.nil?
    log 'Category skipped'
    return
  end

  @offset = @offset + 1
  log 'Creating resource'
  resource = Resource.create('id' => id, 'resource_type' => category)
  full_contents[:lookups][id.to_s] = resource

  log 'Creating content'
  create(category, rsc, resource, full_contents)
  log 'Creating edges'
  @offset = @offset + 1
  unless item['edges'].nil?
    item['edges'].each do |edge|
      edge = create_resource(full_contents[edge['object_id'].to_s], full_contents)
      resource.resource_links << edge unless edge.nil?
    end
  end
  @offset = @offset - 2
  log "Done with #{id}"
  resource
end

def map_category(cat, full_contents)
  name = full_contents[cat.to_s]['rsc']['name']
  return name if name == 'news' or name == 'article'
  return 'author' if name == 'person'
  return 'url' if name == 'website'
  nil
end

def create(category, rsc, resource, full_contents)
  case category
    when 'url'
      Url.create(:name => get_attr('title', rsc),
                 :url => rsc['website'],
                 :lang => '*',
                 :resource_id => resource.id,
                 :created_at => Date.parse(rsc['created']),
                 :updated_at => Date.parse(rsc['modified'])
      )
    when 'author'
      Author.create(:name => get_attr('title', rsc),
                    :lang => 'ru',
                    :resource_id => resource.id,
                    :slug => rsc['slug'],
                    :created_at => Date.parse(rsc['created']),
                    :updated_at => Date.parse(rsc['modified'])
      )
    when 'article'
      Article.create(:title => get_attr('title', rsc),
                     :body => parse_media(get_attr('body', rsc), full_contents),
                     :format => 'html',
                     :lang => 'ru',
                     :resource_id => resource.id,
                     :slug => rsc['slug'],
                     :created_at => Date.parse(rsc['created']),
                     :updated_at => Date.parse(rsc['modified'])
      )
    when 'news'
      if get_attr('body', rsc).nil?
        puts rsc
        puts resource.id
        puts rsc['body'].nil?
        #puts rsc['body']['trans']
      end
      News.create(:title => get_attr('title', rsc),
                  :body => parse_media(get_attr('body', rsc), full_contents),
                  :format => 'html',
                  :lang => 'ru',
                  :resource_id => resource.id,
                  :slug => rsc['slug'],
                  :created_at => Date.parse(rsc['created']),
                  :updated_at => Date.parse(rsc['modified'])
      )
  end
end

def get_attr(attr, rsc)
  return '<empty> ?? ' if rsc[attr].nil?
  return rsc[attr] if rsc[attr]['trans'].nil?
  return '' if rsc[attr]['trans']['ru'].nil? and rsc[attr]['trans']['en'].nil?
  return rsc[attr]['trans']['en'] if rsc[attr]['trans']['ru'].nil?
  rsc[attr]['trans']['ru']
end

def parse_media(text, full_contents)
  return '' if text.nil?
  rx = /(<!\-\-\sz\-media\s)(\d+)(\s.+?\-\->)/
  results = text.scan(rx)
  results.each do |result|
    item = full_contents[result[1]]
    html = if item.nil? or item['medium'].nil? or item['medium']['video_embed_code'].nil?
             ''
           else
             item['medium']['video_embed_code']
           end
    text = text.sub(result.join, html)
  end
  text
end

def log(text)
  str = '.' * @offset
  puts "#{str}#{text}"
end
