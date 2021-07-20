class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :basic_auth

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD']
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :age, :height, :basis_weight])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname, :age, :height, :basis_weight])
  end

  def after_sign_in_path_for(resource)
    mypage_path(resource)
  end
end
