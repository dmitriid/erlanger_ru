class EventsController < ApplicationController
  def index
    @events_list = Event.all
  end
end
