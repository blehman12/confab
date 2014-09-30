json.array!(@businesses) do |business|
  json.extract! business, :name, :parent_id
  json.url business_url(business, format: :json)
end