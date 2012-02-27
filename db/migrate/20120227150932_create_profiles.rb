class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :about
      t.string :location
      t.string :website
      t.string :picture

      t.timestamps
    end
  end
end
