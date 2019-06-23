# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(_artist)
    artist_path(@artist)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[avatar nickname birthdate origin biography email_confirmation password password_confirmation])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[avatar nickname birthdate origin biography email_confirmation password password_confirmation])
  end
end
