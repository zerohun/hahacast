json.(@usercasts) do |json, usercast|
  json.id usercast.id
  json.created_at usercast.created_at
  json.user_name usercast.user.name
  json.user_id usercast.user.id
end

