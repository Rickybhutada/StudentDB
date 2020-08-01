class ApplicationController < ActionController::Base

  def authenticate_session
    redirect_to root_path, alert: "Please login First" unless user_signed_in?
  end
end
