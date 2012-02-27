class New < ActiveRecord::Base
  belongs_to :informable, :polymorphic => true


end
