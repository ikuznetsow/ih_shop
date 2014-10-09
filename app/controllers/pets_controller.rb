class PetsController < ApplicationController
  def index
  	@pets = Pet.all
  end

  def new
  	@pet = Pet.new
  end

  def edit
  	set_pet
  end

  def create
  	@pet = Pet.new(pet_params)
  	if @pet.save
  		redirect_to pets_path
  	else
  		render :new
  	end
  end

  def update
  	set_pet
  	if @pet.update_attributes(pet_params)
  		redirect_to pets_path
		else
			render :edit
		end
  end

   def destroy
  	set_pet
	  @pet.destroy
	 	redirect_to pets_path
  end



  private
  def set_pet
   	@pet = Pet.find(params[:id])	
  end

  def pet_params
  	params.require(:pet).permit(:name, :weight, :price, :animal_id, :user_id)	
  end
end
