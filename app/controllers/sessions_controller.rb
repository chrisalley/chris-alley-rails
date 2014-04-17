class SessionsController < ApplicationController
  
  after_action :verify_authorized, except: [:new, :create, :destroy]

  def create
    user = User.find_by_name_or_email_address(params[:name_or_email_address])
    if user && user.authenticate(params[:password])
      if params[:remember_me]
        cookies.permanent[:authentication_token] = user.authentication_token
      else
        cookies[:authentication_token] = user.authentication_token
      end
      redirect_to root_url, notice: "Logged in!"
    else
      flash.now.alert = "Invalid email address or password."
      render :new
    end
  end

  def destroy  
    cookies.delete(:authentication_token)
    redirect_to root_url, notice: "Logged out!"  
  end
  
end
