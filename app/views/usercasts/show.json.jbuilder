json.(@usercast, :id)
json.user do |json|
  json.(@usercast.user, :id, :name)
end
<% if @usercast.mentions.size > 0 %>
  json.mentions @usercast.tree_sorted_mentions, :id, :file, :depth, :created_at, :user_name, :user_image
<% end %>
