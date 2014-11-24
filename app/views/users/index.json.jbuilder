json.array!(@users) do |user|
  json.extract! user, :id, :pennkey, :email, :school, :privilege
  json.url user_url(user, format: :json)
end
