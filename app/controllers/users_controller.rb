class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  
  def index
    @users = User.all
  end
  
  def new 
    @user = User.new
  end
  
  def create
    @user = User.create(user_params)
    
    if @user.save
      flash[:notice] = "You have successfully signed up"
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end 
  
  def show
    
  end
  
  def edit
    
  end
  
  def update
    if @user.update!(user_params)
      flash[:notice] = "User was successfully updated"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def destroy
    @user.destroy
      flash[:notice] = "User was successfully deleted." 
      redirect_to users_path
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email)
  end
  
  def set_user
    @user = User.find(params[:id])
  end
  
end