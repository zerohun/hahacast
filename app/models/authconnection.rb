class Authconnection < ActiveRecord::Base
  belongs_to :user
  validate :provider, :uniqueness => true
  attr_accessible :provider, :uid, :access_token
end
