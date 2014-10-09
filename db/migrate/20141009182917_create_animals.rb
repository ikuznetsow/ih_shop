class CreateAnimals < ActiveRecord::Migration
  def change
    create_table :animals do |t|
      t.string :animal_type
      t.integer :average_weight
      t.integer :quantity_in_store

      t.timestamps
    end
  end
end
