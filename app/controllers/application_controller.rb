class ApplicationController < ActionController::Base
  protect_from_forgery

  # before_filter :check_logged_in

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def logged_in?
    !!current_user
  end

  def login(user)
    @current_user = user
    session[:user_id] = user.id
  end

  def check_logged_in
    unless logged_in?
      render json: { errors: 'Must be logged in' }, status: :forbidden
    end
  end
end
