class AddAncestryToBullets < ActiveRecord::Migration[7.0]
  def change
    add_column :bullets, :ancestry, :string
    add_index :bullets, :ancestry
  end
end
