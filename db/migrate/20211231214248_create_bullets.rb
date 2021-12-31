class CreateBullets < ActiveRecord::Migration[7.0]
  def change
    create_table :bullets do |t|
      t.references :parent, foreign_key: {to_table: :bullets}
      t.references :collection
      t.references :pointer, foreign_key: {to_table: :bullets} # If it has been scheduled or migrated, this points to the new bullet
      t.text :body
      t.integer :state
      t.date :date 
      t.integer :type
      t.boolean :priority
      t.boolean :inspiration
      t.timestamps
    end
  end
end
