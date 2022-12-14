# frozen_string_literal: true

class SubjectsController < ApplicationController
  # before_action :set_subject, only: %i[ show edit update destroy ]
  # before_action :is_school_admin, except: %i[ index show]

  # GET /subjects or /subjects.json
  def index
    subjects = Subject.all.order("name asc")
    render status: :ok, json: subjects.to_json
  end

  # GET /subjects/1 or /subjects/1.json
  def show
    subject = Subject.find(params[:id])
    render status: :ok, json: subject.to_json
  end

  # POST /subjects or /subjects.json
  def create
    subject = Subject.new(subject_params)
    subject.save!
    render status: :ok, json: { notice: "Subject was successfully created." }
  end

  # PATCH/PUT /subjects/1 or /subjects/1.json
  def update
    respond_to do |format|
      if @subject.update(subject_params)
        format.html { redirect_to subject_url(@subject), notice: "Subject was successfully updated." }
        format.json { render :show, status: :ok, location: @subject }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subjects/1 or /subjects/1.json
  def destroy
    @subject.destroy

    respond_to do |format|
      format.html { redirect_to subjects_url, notice: "Subject was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_subject
      @subject = Subject.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def subject_params
      params.require(:subject).permit(:name)
    end
end
