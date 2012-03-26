json.(@usercast, :id)
json.user do |json|
  json.(@usercast.user, :id, :name)
end
json.mentions @usercast.tree_sorted_mentions, :id, :file, :depth, :created_at, :user_name, :user_image
