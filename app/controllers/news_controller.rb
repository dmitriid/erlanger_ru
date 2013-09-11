class NewsController < ApplicationController
  def index
    @news_list = News.all
  end

  def show
  end

  def update
  end

  def destroy
  end
end
