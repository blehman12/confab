json.array!(@categories) do |category|
  json.extract! category, :category, :theme_id
  json.url category_url(category, format: :json)
end