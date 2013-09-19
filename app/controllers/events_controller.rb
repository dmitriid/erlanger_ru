class EventsController < ApplicationController
  def index
    @events_list = Resource::find('event')
  end

  def show
    # TODO: If locale is not RU and object is not found, query RU locale
    # @event = get_event(lang) || get_event(SOMETHING.config.i18n.default_locale.SOMETHING)
    @item = Resource::find('event', params[:id])
  end
end
