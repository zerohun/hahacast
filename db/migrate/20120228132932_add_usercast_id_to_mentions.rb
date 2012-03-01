class AddUsercastIdToMentions < ActiveRecord::Migration
  def change
    add_column :mentions, :usercast_id, :integer

  end
end
