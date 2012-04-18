class Mention < ActiveRecord::Base
  has_ancestry
  attr_accessible :file, :parent_id, :usercast_id
  mount_uploader :file, SoundUploader
  validates :file,  :presence => true
  belongs_to :user
  belongs_to :usercast
  has_one :notification, :as => :notifiable, :dependent => :destroy

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

  def self.paginate_by_root_nodes(mentions, page_number)
    root_nodes = mentions.roots.paginate(:page => page_number, :per_page => 5)
    nodes = []
    nodes = nodes + root_nodes
    root_nodes.each do |root|
      nodes = nodes + root.descendants
    end
    nodes
  end



  private
  def notify_to_news_feed
    #self.build_notification
  end
end
