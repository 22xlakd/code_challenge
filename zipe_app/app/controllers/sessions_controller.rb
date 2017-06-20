class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:username])
    if user and user.authenticate(params[:password])
      env[:current_user] = user
      set_current_user

      redirect_to video_url(params[:video_id])
    else
      redirect_to login_url, alert: "Invalid user/password combination"
    end
  end

  def destroy
    env[:current_user] = nil
    logout

    redirect_to store_url, notice: "Logged out"
  end
end
