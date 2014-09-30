json.array!(@transportations) do |transportation|
  json.extract! transportation, :name, :parent_id
  json.url transportation_url(transportation, format: :json)
end