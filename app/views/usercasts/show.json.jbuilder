json.(@usercast, :id)
if @mention_id
  json.mention_id @mention_id
end
if @page_number
  json.page_number @page_number
else
  json.page_number 1
end
if current_user
  json.current_user do |json|
    json.(current_user, :id)
  end

  if current_user == @usercast.user
    json.friend_state "myself"
  else
    if current_user.is_matched_friend_with? @usercast.user
      json.friend_state 1    #matched friend
    elsif current_user.sent_friend_request_to? @usercast.user
      json.friend_state 2    #sent friend request
    else
      json.friend_state 3    #not friend
    end
  end
else
  json.current_user "not loggedin"
  json.friend_state "not loggedin"
end

json.user do |json|
  json.(@usercast.user, :id, :name)
end
#json.mentions Mention.sort_by_ancestry(Mention.paginate_by_root_nodes(@usercast.mentions.includes(:user).order("updated_at"), @page_number)), :id, :file, :depth, :created_at, :user_name, :user_image

#json.mentions Mention.sort_by_ancestry(@usercast.mentions.includes(:user).order("created_at")), :id, :file, :depth, :created_at, :user_name, :user_image, :usercast_id
json.mentions @usercast.tree_sorted_mentions, :id, :file, :depth, :created_at, :user_name, :user_image, :usercast_id
