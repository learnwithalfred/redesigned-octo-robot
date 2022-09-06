# frozen_string_literal: true

class SubjectsController < ApplicationController
  before_action :set_subject, only: %i[ show edit update destroy ]
  # before_action :is_school_admin, except: %i[ index show]

  def index
    subjects = Subject.all.order("name asc")
    render status: :ok, json: subjects.to_json
  end

  def show
    render status: :ok, json: @subject.to_json
  end

  def create
    subject = Subject.new(subject_params)
    subject.save!

    respond_with_success(t("successfully_created", entity: "Subject"))
  end

  def update
    @subject.update!(subject_params)
    respond_with_success(t("successfully_updated", entity: "Subject"))
  end

  def destroy
    @subject.destroy!
    respond_with_json
  end

  private

    def set_subject
      @subject = Subject.find(params[:id])
    end

    def subject_params
      params.require(:subject).permit(:name)
    end
end
