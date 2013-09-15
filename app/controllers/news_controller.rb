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

    news = News.new
    news.save

    id = news.id

    params[:items].each do |item|
      params = ActionController::Parameters.new(item)
      news_item = I18nNews.new params.permit(:body, :title)
      news_item.save
    end

    render :status => :created, :location => "/news/#{id}", :layout => false
  end

  # static
  def self.get_news(lang)
    News.includes(:i18n_news).where("i18n_news.lang_iso639" => lang).to_a
  end
end
