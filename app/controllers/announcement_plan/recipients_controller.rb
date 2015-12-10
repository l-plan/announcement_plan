require_dependency "announcement_plan/application_controller"

module AnnouncementPlan
  class RecipientsController < ApplicationController
    before_action :set_recipient, only: [:show, :edit, :update, :destroy] 


    # GET /recipients
    def index
      @recipients = Recipient.all
    end

    # GET /recipients/1
    def show
    end

    # GET /recipients/new
    def new

    # respond_to do |format|
    #   format.html # show.html.erb
    #   format.js { render json: @timer }
    # end
      @recipient = Recipient.new
    end

    # GET /recipients/1/edit
    def edit
    end

    # POST /recipients
    def create
      @recipient = Recipient.new(recipient_params)

      # if @recipient.save
      #   redirect_to @recipient, notice: 'Recipient was successfully created.'
      # else
      #   render :new
      # end


    respond_to do |format|
      if @recipient.save


          format.html {redirect_to @recipient, notice: 'Recipient was successfully created.'}
          format.js {}

      else
        format.html { render action: 'new' }
        
        format.js
      end
    end



    end

    # PATCH/PUT /recipients/1
    def update
      if @recipient.update(recipient_params)
        redirect_to @recipient, notice: 'Recipient was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /recipients/1
    def destroy
      @recipient.destroy
      redirect_to recipients_url, notice: 'Recipient was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_recipient
        @recipient = Recipient.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def recipient_params
        params.require(:recipient).permit(:announcement_id, :user_id)
      end
  end
end
