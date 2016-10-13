json.array!(@users) do |user|
  json.extract! user, :id, :username, :email, :age, :sex, :bio, :picture
  json.url user_url(user, format: :json)
end
