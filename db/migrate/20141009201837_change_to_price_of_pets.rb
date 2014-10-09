class ChangeToPriceOfPets < ActiveRecord::Migration
  def change
  	add_column :pets, :price, :integer
  	remove_column :pets, :color 

  end
end
