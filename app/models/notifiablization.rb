class Notifiablization < ActiveRecord::Base
  belongs_to :user
  belongs_to :notification
end
