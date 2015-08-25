json.array!(@posts) do |post|
  json.extract! post, :id, :name, :description, :url
  json.url post_url(post, format: :json)
end
