# frozen_string_literal: true

class CoursesController < ApplicationController
  before_action :set_course, only: %i[ show edit update destroy ]
  # before_action :is_school_admin, except: %i[ index show]
  # before_action :authenticate_user!

  # GET /courses or /courses.json
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

  # POST /courses or /courses.json
  def create
    @course = current_user.courses.new(course_params)
    if @course.save
      render :show, status: :created, location: @course
    else
      render json: @course.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /courses/1 or /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to course_url(@course), notice: "Course was successfully updated." }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1 or /courses/1.json
  def destroy
    @course.destroy

    respond_to do |format|
      format.html { redirect_to courses_url, notice: "Course was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def course_params
      params.require(:course)
        .permit(
          :classroom_id,
          :subject_id,
          :course_date, :status, :title, :content)
    end
end
