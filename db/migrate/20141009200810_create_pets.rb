class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :name
      t.integer :weight
      t.string :color
      t.integer :animal_id
      t.integer :user_id

      t.timestamps
    end
  end
end
