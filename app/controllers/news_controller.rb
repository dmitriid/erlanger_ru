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

  # static
  def self.get_news(lang)
    News.includes(:i18n_news).where("i18n_news.lang_iso639" => lang).to_a
  end
end
