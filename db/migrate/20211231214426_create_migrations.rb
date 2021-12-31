class CreateMigrations < ActiveRecord::Migration[7.0]
  def change
    create_table :migrations do |t|
      t.references :from, foreign_key: {to_table: :bullets}
      t.references :to, foreign_key: {to_table: :bullets}
      t.string :reason
      t.text :note
      t.timestamps
    end
  end
end
