json.array!(@technologies) do |technology|
  json.extract! technology, :name, :parent_id
  json.url technology_url(technology, format: :json)
end