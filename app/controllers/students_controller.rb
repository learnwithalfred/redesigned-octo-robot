# frozen_string_literal: true

class StudentsController < ApplicationController
  before_action :set_student, only: %i[ show edit update destroy ]
  # before_action :is_school_admin, except: %i[ index show]
  # before_action :authenticate_user!

  # GET /students or /students.json
  def index
    students = Student.all
    render status: :ok, json: students.to_json(include: [:user, :classroom])
  end

  def show
    student = Student.find(params[:id])
    render status: :ok, json: student.to_json(include: [:user, :classroom])
  end

  def create
    @student = Student.new(student_params)
    @student.save!
    respond_with_success(t("successfully_created", entity: "Student"))
   end

  def update
    @student.update!(student_params)
    respond_with_success(t("successfully_updated", entity: "Student"))
  end

  def destroy
    @student.destroy!
    respond_with_json
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    def student_params
      params.require(:student).permit(:dob, :contact, :father, :mother, :about, :user_id, :classroom_id)
    end
end
