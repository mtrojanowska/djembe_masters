# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit
  before_action :configure_permitted_parameters, if: :devise_controller?

  def pundit_user
    current_artist
  end

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def after_sign_in_path_for(_artist)
    artist_path(@artist)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[avatar nickname birthdate origin biography email_confirmation password password_confirmation])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[avatar nickname birthdate origin biography email_confirmation password password_confirmation])
  end
end

private
def artist_not_authorized
  flash[:warning] = 'You are not authorized to perform this action.'
  redirect_to(request.referrer || root_path)
end
