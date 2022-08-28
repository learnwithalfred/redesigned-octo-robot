# frozen_string_literal: true

class ClassroomsController < ApplicationController
  before_action :set_classroom, except: %i[ index new create]
  before_action :authenticate_user!
  before_action :require_classroom_permission, except: %i[ show classroom_course classroom_students]
  before_action :is_school_admin, only: %i[ new create update destroy]

  # GET /classrooms or /classrooms.json
  def index
    @classrooms = Classroom.all
  end

  # GET /classrooms/1 or /classrooms/1.json
  def show
  end

  # GET /classrooms/new
  def new
    @classroom = Classroom.new
  end

  # GET /classrooms/1/edit
  def edit
  end

  # POST /classrooms or /classrooms.json
  def create
    @classroom = Classroom.new(classroom_params)

    respond_to do |format|
      if @classroom.save
        format.html { redirect_to classroom_url(@classroom), notice: "Classroom was successfully created." }
        format.json { render :show, status: :created, location: @classroom }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @classroom.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /classrooms/1 or /classrooms/1.json
  def update
    respond_to do |format|
      if @classroom.update(classroom_params)
        format.html { redirect_to classroom_url(@classroom), notice: "Classroom was successfully updated." }
        format.json { render :show, status: :ok, location: @classroom }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @classroom.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /classrooms/1 or /classrooms/1.json
  def destroy
    @classroom.destroy

    respond_to do |format|
      format.html { redirect_to classrooms_url, notice: "Classroom was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def classroom_course
    @courses = @classroom.courses
    @classroom = @classroom.name
  end

  def classroom_students
    @students = @classroom.students
    @classroom = @classroom.name
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_classroom
      @classroom = Classroom.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def classroom_params
      params.require(:classroom).permit(:name, :role)
    end

    def in_classroom
      current_user.student.classroom.id? &&
      current_user.student.classroom.id == params[:id]
    end

    def require_classroom_permission
      unless current_user.admin? ||
             current_user.super_admin? ||
             current_user.teacher? ||
             current_user.role == "learner" && in_classroom
        flash[:danger] = "You do not have permission to attend this class"
        if current_user.role == "learner" && current_user.student.classroom.id != nil
          redirect_to "/classrooms/#{current_user.student.classroom.id}"
        else
          redirect_to root_path
        end
      end
    end
end
