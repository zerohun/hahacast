class AddMatchedToFriendships < ActiveRecord::Migration
  def change
    add_column :friendships, :matched, :boolean

  end
end
