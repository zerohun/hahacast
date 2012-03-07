class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :token_authenticatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  has_many :mentions, :dependent => :destroy
  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :inverse_friendships, :foreign_key => "friend_id", :class_name => "Friendship"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user
  has_many :authconnections
  has_many :usercasts

  has_one :profile
  after_create :create_usercast

  def name
    profile = self.profile
    profile.first_name + " " + profile.last_name
  end


  def facebook
    self.authconnections.find_by_provider("facebook")
  end

  def sent_friend_request_to?(user)
    self.friends.include? user
  end

  def got_friend_request_from?(user)
    self.inverse_friends.include? user
  end

  def is_matched_friend_with?(user)
    sent_friend_request_to?(user) && got_friend_request_from?(user)
  end

  private
  def create_usercast
    self.usercasts.build
  end

end
