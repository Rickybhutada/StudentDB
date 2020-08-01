# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # The path used after sign up.
  def after_sign_in_path_for(resource)
    if current_user.blank?
      restrict_user( "Access Restricted")
    else
      session[:id] = current_user.id
      students_path
    end
  end

  def restrict_user(message)
    sign_out(resource_name)
    flash[:alert] = message
    root_path
  end
end
