class EventsController < ApplicationController
  def index
    @events_list = EventsController::get_events(I18n.locale.to_s)
  end

  def show
    # TODO: If locale is not RU and object is not found, query RU locale
    # @event = get_event(lang) || get_event(SOMETHING.config.i18n.default_locale.SOMETHING)
    @event = EventsController::get_event(I18n.locale.to_s) ||
        EventsController::get_event("ru")
  end

  # static
  def self.get_event(lang)
    Event.includes(:i18n_events).
        where("i18n_events.lang_iso639" => lang).take
  end

  # static
  def self.get_events(lang)
    return Event.includes(:i18n_events).where("i18n_events.lang_iso639" => lang).to_a
  end
end
