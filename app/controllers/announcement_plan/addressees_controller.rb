require_dependency "announcement_plan/application_controller"

module AnnouncementPlan
  class AddresseesController < ApplicationController
    before_action :set_addressee, only: [:show, :edit, :update, :destroy]

    # GET /addressees
    def index
      @addressees = Addressee.all
    end

    # GET /addressees/1
    def show
    end

    # GET /addressees/new
    def new
      @addressee = Addressee.new
    end

    # GET /addressees/1/edit
    def edit
    end

    # POST /addressees
    def create
      @addressee = Addressee.new(addressee_params)

      if @addressee.save
        redirect_to @addressee, notice: 'Addressee was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /addressees/1
    def update
      if @addressee.update(addressee_params)
        redirect_to @addressee, notice: 'Addressee was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /addressees/1
    def destroy
      @addressee.destroy
      redirect_to addressees_url, notice: 'Addressee was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_addressee
        @addressee = Addressee.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def addressee_params
        params.require(:addressee).permit(:announcement_id, :user_id)
      end
  end
end
