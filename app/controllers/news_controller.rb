class NewsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    @news_list = NewsController::get_news(I18n.locale.to_s)
  end

  def show
    begin
      @item = News.find(params[:id])
                  .i18n_news
                  .where("lang_iso639" => I18n.locale.to_s)
                  .first
      if @item == nil
        flash[:notice] = t('errors.only_default_language_availabe')
        @item = News.find(params[:id])
                    .i18n_news
                    .where("lang_iso639" => Erlanger::Application.config.i18n.default_locale)
                    .first
      end
    rescue Exception => msg
      render :status  => :not_found,
             :nothing => true
    end
  end

  def update
  end

  def destroy
  end

  def create
    return render :status => 400, :layout => false if params[:items] == nil

    news = News.create :created_by => 'admin'

    params[:items].each do |lang, data|
      news.i18n_news.create :news_id     => news[:id],
                            :title       => data[:title],
                            :body        => data[:body],
                            :intro       => data[:intro],
                            :format      => data[:format] || 'html',
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
        .limit(20)
        .to_a
  end
end
