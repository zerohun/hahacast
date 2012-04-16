class Notification < ActiveRecord::Base 
  has_many :notifiablization
  has_many :users, :through => :notifiablization
  belongs_to :notifiable, :polymorphic => true

  #def notify_text
    #if self.notifiable_type == "Mention"
      #return "spoke on #{notifiable.usercast.user.name}'s cast"
    #end
    #if self.notifiable_type == "Friendship"
      #return "#{notifiable.user.name} is friend with #{notifiable.friend.name}"
    #end

  #end
end
