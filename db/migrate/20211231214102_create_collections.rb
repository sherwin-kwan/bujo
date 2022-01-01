class CreateCollections < ActiveRecord::Migration[7.0]
  def change
    create_table :collections do |t|
      t.integer :collection_type
      t.date :start_date
      t.timestamps
    end
  end
end
