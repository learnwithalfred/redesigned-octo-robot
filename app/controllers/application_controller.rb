# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def is_school_admin
    unless current_user.admin? || current_user.super_admin? || current_user.teacher? || current_user.staff?
      flash[:danger] = "You do not have permission to perform this task"
      redirect_to root_path
    end
  end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :gender, :address])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :gender, :address])
    end
end
