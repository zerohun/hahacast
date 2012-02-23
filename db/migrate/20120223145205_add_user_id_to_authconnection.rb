class AddUserIdToAuthconnection < ActiveRecord::Migration
  def change
    add_column :authconnections, :user_id, :integer

  end
end
