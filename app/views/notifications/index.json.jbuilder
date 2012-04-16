json.(@notifications) do |json, notification|
  json.type notification.notifiable_type
  json.notifiable_id notification.notifiable.id
  json.user_id notification.notifiable.user_id
  json.user_name notification.notifiable.user.name
  if notification.notifiable_type == 'Friendship'

    json.friend_id notification.notifiable.friend_id
    json.friend_name notification.notifiable.friend.name
    json.usercast_id notification.notifiable.user.usercasts.first.id
    json.friendcast_id notification.notifiable.friend.usercasts.first.id

  else
    json.friend_id 'n'
    json.friend_name 'n'

  end
  
  if notification.notifiable_type == 'Mention'
    json.mention_id notification.notifiable.id
    json.usercast_owner_name notification.notifiable.usercast.user.name
    json.usercast_id notification.notifiable.usercast_id
  else
    json.mention_id 'n'
    json.usercast_owner_name 'n'
  end

end
