class Profile < ActiveRecord::Base
  belongs_to :user
  #mount_uploader :picture, PictureUploader
  attr_accessible :first_name, :last_name, :username, :about, :location, :website, :picture
  validate :first_name, :presence => true
  validate :last_name, :presence => true
  validate :username, :presence => true

end
