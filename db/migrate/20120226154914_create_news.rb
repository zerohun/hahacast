class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.references :informable, :polymorphic => true

      t.timestamps
    end
  end
end
