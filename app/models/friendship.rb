class Friendship < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, :class_name => "User"

  has_one :new, :as => :informable, :dependent => :destroy




  def matched_inverse
    Friendship.find(:first, :conditions => {:friend_id => self.user_id, :user_id => self.friend_id})

  end



end
