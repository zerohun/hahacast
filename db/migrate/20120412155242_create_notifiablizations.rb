class CreateNotifiablizations < ActiveRecord::Migration
  def change
    create_table :notifiablizations do |t|
      t.integer :user_id
      t.integer :notification_id

      t.timestamps
    end
  end
end
