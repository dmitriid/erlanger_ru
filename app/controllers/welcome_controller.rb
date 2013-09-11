class WelcomeController < ApplicationController
  def index
    @frontpage_news = News.all
    @frontpage_events = Event.all
    @tweets = Twitter.search("#erlang -rt", :lang => "ru", :count => 5).results
  end
end
