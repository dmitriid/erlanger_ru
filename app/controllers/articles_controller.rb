class ArticlesController < ApplicationController
  def index
    @articles_list = Resource::find('article')
  end

  def show
    @item = Resource::find('article', params[:id])
  end

  def update
  end

  def destroy
  end

  end
