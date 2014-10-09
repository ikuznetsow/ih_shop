class ChangeToMaxCapacityOfAnimals < ActiveRecord::Migration
  def change
  	rename_column :animals, :quantity_in_store, :max_in_store
  end
end
