class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.get_api_user(params[:username], params[:password])
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id

      redirect_to video_url(params[:video_id])
    else
      redirect_to login_url, alert: "Invalid user/password combination"
    end
  end

  def destroy
    session[:user_id] = nil

    redirect_to root_url, notice: "Logged out"
  end
end
