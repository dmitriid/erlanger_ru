class NewsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    @news_list = NewsController::get_news(I18n.locale.to_s)
  end

  def show
  end

  def update
  end

  def destroy
  end

  def create
    puts params
    return render :status => 400, :layout => false if params[:items] == nil

    news = News.create :created_by => 'admin'

    params[:items].each do |lang, data|
      news.i18n_news.create :news_id     => news[:id],
                            :title       => data[:title],
                            :body        => data[:body],
                            :intro       => data[:intro],
                            :lang_iso639 => lang
    end

    render :status   => :created,
           :location => "/news/#{news[:id]}",
           :nothing  => true
  end

  # static
  def self.get_news(lang)
    News.includes(:i18n_news)
        .where("i18n_news.lang_iso639" => lang)
        .order("created_at DESC")
        .to_a
  end
end
