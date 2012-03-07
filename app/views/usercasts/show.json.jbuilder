json.(@usercast, :id)
json.user do |json|
  json.(@usercast.user, :id, :name)
end
json.mentions @usercast.mentions, :file, :depth ,:created_at

