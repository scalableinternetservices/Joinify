module EventsHelper
  def cache_key_for_events_table
    ("events_table/#{Event.maximum(:updated_at)}")
  end
end
