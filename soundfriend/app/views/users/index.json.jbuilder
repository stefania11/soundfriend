json.array!(@users) do |user|
  json.extract! user, :id, :new, :name, :email, :image_url, :admin, :soundfriend, :instagram, :twitter
  json.url user_url(user, format: :json)
end
