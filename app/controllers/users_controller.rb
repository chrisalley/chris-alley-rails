class UsersController < ApplicationController
  load_resource find_by: :url
  authorize_resource
  
  def index
    @users = User.order(:name).page(params[:page]) 
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path, notice: "Registered!"
    else  
      render 'new' 
    end  
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to users_path, notice: "Successfully updated profile."
    else
      render 'edit'
    end
  end

  def destroy    
    @user.destroy
    redirect_to users_path, notice: "Successfully destroyed user."
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :email_address, :password, :password_confirmation, :role)
  end
end
