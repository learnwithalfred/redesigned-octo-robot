# frozen_string_literal: true

class AnnouncementsController < ApplicationController
  before_action :set_announcement, only: %i[ show update destroy ]
  # before_action :is_school_admin, except: %i[ index show]

  # GET /announcements or /announcements.json
  def index
    announcements = Announcement.all.order("created_at DESC")
    render status: :ok, json: { announcements: announcements }
  end

  # GET /announcements/1 or /announcements/1.json
  def show
    announcement = Announcement.find(params[:id])
    render status: :ok, json: { announcement: announcement }
  end

  # POST /announcements or /announcements.json
  def create
    @announcement = Announcement.new(announcement_params)

    respond_to do |format|
      if @announcement.save
        format.html { redirect_to announcement_url(@announcement), notice: "Announcement was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /announcements/1 or /announcements/1.json
  def update
    respond_to do |format|
      if @announcement.update(announcement_params)
        format.html { redirect_to announcement_url(@announcement), notice: "Announcement was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /announcements/1 or /announcements/1.json
  def destroy
    @announcement.destroy

    respond_to do |format|
      format.html { redirect_to announcements_url, notice: "Announcement was successfully destroyed." }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_announcement
      @announcement = Announcement.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def announcement_params
      params.require(:announcement).permit(:title, :content)
    end
end
