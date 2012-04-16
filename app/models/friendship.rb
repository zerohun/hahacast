class Friendship < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, :class_name => "User"
  has_one :notification, :as => :notifiable, :dependent => :destroy
  attr_accessible :friend_id, :user_id
  #after_create :notify_to_news_feed

  def matched_inverse
    Friendship.find(:first, :conditions => {:friend_id => self.user_id, :user_id => self.friend_id})
  end

  private
  def notify_to_news_feed
    #self.build_new
  end

end
