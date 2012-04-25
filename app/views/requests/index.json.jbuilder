json.(@requests) do |json, friend|
  json.id friend.id
  json.usercast_id friend.usercasts.first.id
  json.name friend.name

  if friend.profile.exist?
    json.picture friend.profile.picture
  end
end
