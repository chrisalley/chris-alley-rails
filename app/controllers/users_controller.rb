class UsersController < ApplicationController
  before_action :load_user, except: [:index, :new, :create]

  def index
    @users = policy_scope(User.order(:name).page(params[:page]))
  end

  def new
    @user = User.new
    authorize @user
  end

  def create
    @user = User.new(user_params)
    authorize @user
    if @user.save
      redirect_to users_path, notice: "Registered!"
    else
      render :new
    end
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to users_path, notice: "Successfully updated profile."
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path, notice: "Successfully destroyed user."
  end

  private

  def user_params
    params.require(:user).permit(
      :name,
      :email_address,
      :password,
      :password_confirmation,
      :role
    )
  end

  def load_user
    @user = User.find_by url: params[:id]
    authorize @user
  end
end
