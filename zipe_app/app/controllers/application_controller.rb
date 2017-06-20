class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def set_current_user
    @current_user ||= env[:current_user]
  end

  def logout
    @current_user = nil
  end
end
