class ArticlesController < ApplicationController
  def index
    @articles_list = ArticlesController::get_articles(I18n.locale.to_s)
  end

  def show
    @article = Article.includes(:i18n_articles).
        where("i18n_articles.lang_iso639" => I18n.locale.to_s)
        .take
  end

  def update
  end

  def destroy
  end

  # static
  def self.get_articles(lang)
    return Article.includes(:i18n_articles)
                  .where("i18n_articles.lang_iso639" => lang)
                  .to_a
  end
end
