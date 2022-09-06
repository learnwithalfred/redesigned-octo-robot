# frozen_string_literal: true

class AnnouncementsController < ApplicationController
  before_action :set_announcement, only: %i[ show update destroy ]
  # before_action :is_school_admin, except: %i[ index show]

  def index
    announcements = Announcement.all.order("created_at DESC")
    render status: :ok, json: { announcements: announcements }
  end

  def show
    announcement = Announcement.find(params[:id])
    render status: :ok, json: { announcement: announcement }
  end

  def create
    @announcement = Announcement.new(announcement_params)
    @announcement.save!

    respond_with_success(t("successfully_created", entity: "Announcement"))
  end

  def update
    @announcement.update!(announcement_params)
    respond_with_success(t("successfully_updated", entity: "Announcement"))
  end

  def destroy
    @announcement.destroy
    respond_with_json
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
