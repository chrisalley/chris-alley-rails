class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  after_filter :verify_authorized, except: :index
  after_filter :verify_policy_scoped, only: :index

  helper_method :current_user

  before_action :load_pages

  private

  def load_pages
    @about_page = Page.where(url: 'about', publish: true).first
    @other_pages = Page.where(publish: true).where("NOT(url='about')")
  end

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end

  def current_user
    @current_user ||= User.find_by_authentication_token(cookies[:authentication_token]) if cookies[:authentication_token]
  end
end
