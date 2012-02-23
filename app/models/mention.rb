class Mention < ActiveRecord::Base
  has_ancestry
  attr_accessible :file, :parent_id
  mount_uploader :file, SoundUploader
  validates :file,  :presence => true
  belongs_to :user
end
