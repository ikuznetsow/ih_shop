class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :name
      t.integer :weight
      t.string :color
      t.animal_id :integer
      t.user_id :integer
      
      t.timestamps
    end
  end
end
