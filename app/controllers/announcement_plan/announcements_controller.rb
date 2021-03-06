# require_dependency "announcement_plan/application_controller"

module AnnouncementPlan
  class AnnouncementsController < ApplicationController
    before_action :set_announcement, only: [:show, :edit, :update, :destroy]

    # GET /announcements
    def index
      @announcements = Announcement.where(nil)#.for_user(current_user)


      respond_to do |format|
        format.html # index.html.erb
        # format.json { render :json=> Announcement.for_user(current_user), root: false }
        format.json { render :json=> @announcements, root: false}

      end
    end

    # GET /announcements/1
    def show
    end

    # GET /announcements/new
    def new
      @announcement = Announcement.new
    end

    # GET /announcements/1/edit
    def edit
    end

    # POST /announcements
    def create
      # params[:announcement] = {tenant_ids: [],user_ids: []}.merge!(params[:announcement])
      @announcement = Announcement.new(announcement_params)
      # byebug

      if @announcement.save
        redirect_to @announcement, notice: 'Announcement was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /announcements/1
    def update


      if @announcement.update(announcement_params)

        redirect_to @announcement, notice: 'Announcement was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /announcements/1
    def destroy
      @announcement.destroy
      redirect_to announcements_url, notice: 'Announcement was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_announcement
        @announcement = Announcement.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def announcement_params
        params.require(:announcement).permit(:title, :txt, :start_announcing_at, :stop_announcing_at, :category_id, :concept, :role_names)
      
      end
  end
end
