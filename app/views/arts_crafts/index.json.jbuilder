json.array!(@arts_crafts) do |arts_craft|
  json.extract! arts_craft, :name, :parent_id
  json.url arts_craft_url(arts_craft, format: :json)
end