class UsersController < ApplicationController
  
  def index
    @users = User.order(:name).page(params[:page]) 
  end
  
  def show
    @user = User.find_by_url(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def edit
    @user = User.find_by_url(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path, notice: "Registered!"
    else  
      render :new
    end  
  end

  def update
    @user = User.find_by_url(params[:id])
    if @user.update_attributes(user_params)
      redirect_to users_path, notice: "Successfully updated profile."
    else
      render :edit
    end
  end

  def destroy    
    @user = User.find_by_url(params[:id])
    if @user.destroy
      redirect_to users_path, notice: "Successfully destroyed user."
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :email_address, :password, :password_confirmation, :role)
  end

end
