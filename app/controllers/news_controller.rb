class NewsController < ApplicationController
  def index
    @news_list = NewsController::get_news(I18n.locale.to_s)
  end

  def show
  end

  def update
  end

  def destroy
  end

  def self.get_news(lang)
    # return News.includes(:i18n_news).where("i18n_news.lang_iso639" => lang).to_a
    return News.includes(:i18n_news).load
  end
end
