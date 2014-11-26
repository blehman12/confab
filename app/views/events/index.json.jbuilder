json.array!(@events) do |event|
  json.extract! event, :name, :start, :stop, :location, :address, :recurrence, :user, :user_id, :contact, :theme, :category, :subcategoryA, :subcategoryB, :subcategoryC
  json.url event_url(event, format: :json)
end