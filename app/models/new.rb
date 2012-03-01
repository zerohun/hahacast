class New < ActiveRecord::Base
  belongs_to :informable, :polymorphic => true


  def notify_text
    if self.informable_type == "Mention"
      return "#{informable.user.name} spoke on #{informable.usercast.user.name}'s cast"
    end
    if self.informable_type == "Friendship"
      return "#{informable.user.name} is friend with #{informable.friend.name}"
    end

  end



end
