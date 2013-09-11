class WelcomeController < ApplicationController
  def index
    @frontpage_news = News.all
    @frontpage_events = Event.all
  end
end
