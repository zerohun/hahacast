class AddAncestryToMention < ActiveRecord::Migration
  def change
    add_column :mentions, :ancestry, :string

  end
end
