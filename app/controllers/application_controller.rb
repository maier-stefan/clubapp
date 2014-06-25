class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_device_type
  private

  def set_device_type
    request.variant = :phone if browser.mobile?
  end

  def mobile_redirect
    redirect_to root_path + '#/' + mobile_redirect_path[action_name.to_sym].call
  end

  def ensure_mobile?
    request.variant == [:phone] and request.headers['Accept'] != '*/*'
  end

  def render_layout?
    request.variant == [:phone] ? false : true
  end
end
