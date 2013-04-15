class SessionsController < ApplicationController
  def create
    @user = User.find(params[:session][:user_id])
    login(@user)

    render nothing: true, status: :ok
  end
end
