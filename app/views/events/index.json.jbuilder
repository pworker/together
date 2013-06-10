json.array!(@events) do |event|
  json.extract! event, :name, :description, :start_at
  json.url event_url(event, format: :json)
end