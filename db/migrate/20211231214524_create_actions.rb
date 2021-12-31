class CreateActions < ActiveRecord::Migration[7.0]
  def change
    create_table :actions do |t|
      t.text :old
      t.text :new
      t.timestamps
    end
  end
end
