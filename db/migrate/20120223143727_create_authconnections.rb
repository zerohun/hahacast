class CreateAuthconnections < ActiveRecord::Migration
  def change
    create_table :authconnections do |t|
      t.string :access_token
      t.string :uid
      t.string :provider

      t.timestamps
    end
  end
end
