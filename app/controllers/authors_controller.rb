class AuthorsController < ApplicationController
  def index
    @list = Resource::find('author')
  end

  def show
    @item = Resource::find('author', params[:id])
  end

  def update
  end

  def destroy
  end

  end
