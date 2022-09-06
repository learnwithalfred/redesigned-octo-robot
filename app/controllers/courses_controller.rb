# frozen_string_literal: true

class CoursesController < ApplicationController
  before_action :set_course, only: %i[ show update destroy ]
  # before_action :is_school_admin, except: %i[ index show]
  # before_action :authenticate_user!

  def index
    @courses = Course.paginate(page: params[:page], per_page: 10)
    render status: :ok,
      json: {
        courses: @courses,
        page: @courses.current_page,
        pages: @courses.total_pages
      }
  end

  def show
  end

  def create
    course = Course.new(course_params)
    course.save!
    render status: :created, json: {
      course: course,
      notice: "Task was successfully created"
    }
  end

  def update
    @course.update!(course_params)
    respond_with_success(t("successfully_updated", entity: "Course"))
  end

  def destroy
    @course.destroy
    respond_with_json
  end

  private

    def set_course
      @course = Course.find(params[:id])
    end

    def course_params
      params.require(:course)
        .permit(
          :classroom_id,
          :subject_id,
          :course_date,
          :status,
          :title,
          :content,
          :user_id
        )
    end
end
