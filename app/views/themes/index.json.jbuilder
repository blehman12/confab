json.array!(@themes) do |theme|
  json.extract! theme, :name
  json.url theme_url(theme, format: :json)
end