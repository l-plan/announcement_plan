# require_dependency "announcement_plan/application_controller"

module AnnouncementPlan
  class RecipientsController < ApplicationController
    before_action :set_default_response_format

    # POST /recipients
    def create
      @recipient = Recipient.new(recipient_params)
      @recipient.user_id = current_user.id

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

    def update

      @recipient = Recipient.find(params[:id])


        respond_to do |format|
          if @recipient.update(recipient_params)


              # format.html {redirect_to @recipient, notice: 'Recipient was successfully created.'}
              format.js {}

          else
            # format.html { render action: 'new' }

            format.js {}
          end
        end

    end

    private

      # Only allow a trusted parameter "white list" through.
      def recipient_params
        params.require(:recipient).permit(:announcement_id, :user_id, :read)
      end
       def set_default_response_format
    request.format = :js
  end
  end
end
