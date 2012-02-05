class CreateMentions < ActiveRecord::Migration
  def self.up
    create_table :mentions do |t|
      t.string :file
      t.timestamps
    end
  end

  def self.down
    drop_table :mentions
  end
end
