class Mention < ActiveRecord::Base
  has_ancestry
  attr_accessible :file, :parent_id, :usercast_id
  mount_uploader :file, SoundUploader
  validates :file,  :presence => true
  belongs_to :user
  belongs_to :usercast
  has_one :new, :as => :informable, :dependent => :destroy
  after_create :notify_to_news_feed

  def user_name
    self.user.name
  end
  
  def user_image
    self.user.profile.picture
  end

  def sort_by_depth_first
    stack = []
    result = []
    stack << self
    begin
      cursor = stack.last
      result << cursor
      if cursor.has_children?
        stack = stack + cursor.children.reverse
      end
      stack.delete(cursor)
    end while stack.size > 0
    result
  end


  private
  def notify_to_news_feed
    self.build_new
  end
end
