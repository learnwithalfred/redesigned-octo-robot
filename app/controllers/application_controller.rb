# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # before_action :set_cors
  skip_before_action :verify_authenticity_token
  rescue_from ActiveRecord::RecordNotFound, with: :handle_record_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :handle_validation_error
  rescue_from ActiveRecord::RecordNotUnique, with: :handle_record_not_unique
  rescue_from ActionController::ParameterMissing, with: :handle_api_error

  private

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

    def handle_validation_error(exception)
      respond_with_error(exception)
    end

    def handle_record_not_found(exception)
      respond_with_error(exception.message, :not_found)
    end

    def handle_record_not_unique(exception)
      respond_with_error(exception)
    end

    def handle_api_error(exception)
      respond_with_error(exception, :internal_server_error)
    end

    def respond_with_error(message, status = :unprocessable_entity, context = {})
      is_exception = message.kind_of?(StandardError)
      error_message = is_exception ? message.record&.errors.full_messages.to_sentence : message
      render status: status, json: { error: error_message }.merge(context)
    end

    def respond_with_success(message, status = :ok, context = {})
      render status: status, json: { notice: message }.merge(context)
    end

    def respond_with_json(json = {}, status = :ok)
      render status: status, json: json
    end
end
