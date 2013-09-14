class EventsController < ApplicationController
  def index
    @events_list = EventsController::get_events(I18n.locale.to_s)
  end

  # static
  def self.get_events(lang)
    return Event.includes(:i18n_events).where("i18n_events.lang_iso639" => lang).to_a
    # return Event.includes(:i18n_events).load
  end
end
