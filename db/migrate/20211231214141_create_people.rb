class CreatePeople < ActiveRecord::Migration[7.0]
  def change
    create_table :people do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :relationship
      t.date :birthdate
      t.text :info
      t.timestamps
    end
  end
end
