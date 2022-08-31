# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_cors
  skip_before_action :verify_authenticity_token

  def set_cors
    headers["Access-Control-Allow-Origin"] = "*"
    headers["Access-Control-Request-Method"] = "*"
  end

  def is_school_admin
    unless current_user.admin? || current_user.super_admin? || current_user.teacher? || current_user.staff?
      flash[:danger] = "You do not have permission to perform this task"
      redirect_to root_path
    end
  end
end
