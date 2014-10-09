class UsersController < ApplicationController
  before_filter :authorize, :except => [:new, :create, :index]

  def index
  	@users = User.all
  end

  def show
  end

  def new
  	@user = User.new
  end

  def edit
  	if session[:user_id] == params[:id].to_i
  		@user = User.find(params[:id])
  	else
  		# render text: "#{session[:user_id].inspect} ... #{params[:id].inspect}"
  		redirect_to users_path
  	end
  end


  def create
  	@user = User.new(user_params)
  	if @user.save
  		session[:user_id] = @user.id
  		redirect_to users_path
  	else
  		render :new
  	end
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update_attributes(user_params)
  		redirect_to users_path
  	else
  		render :edit
  	end
  end

  def destroy
  	if session[:user_id] == params[:id].to_i
	  	@user = User.find(params[:id])
	  	@user.destroy
	  end	
  	redirect_to users_path
  end

	private
  def user_params
  	params.require(:user).permit(:name, :email, :password, :password_confirmation)	
  end
end
