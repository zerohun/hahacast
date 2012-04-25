json.(@requests) do |json, friend|
  if friend.profile
    json.id friend.id
    json.usercast_id friend.usercasts.first.id
    json.name friend.name
    json.picture friend.profile.picture
  end
end
