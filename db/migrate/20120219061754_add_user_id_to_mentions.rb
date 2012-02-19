class AddUserIdToMentions < ActiveRecord::Migration
  def change
    add_column :mentions, :user_id, :integer

  end
end
