json.array!(@events) do |event|
  json.extract! event, :id, :title, :latitude, :longitude, :start_date, :description, :is_public, :media_path
  json.url event_url(event, format: :json)
end
