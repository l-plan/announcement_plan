# require_dependency "announcement_plan/application_controller"

module AnnouncementPlan
  class CategoriesController < ApplicationController
    before_action :set_category, only: [ :edit, :update, :destroy]

    # GET /categories
    def index
      @categories = Category.all

      respond_to do |format|
        format.html # index.html.erb
        # format.json { render :json=> Announcement.for_user(current_user), root: false }
        format.json { render :json=> @categories, root: false }

      end
    end


    # GET /categories/new
    def new
      @category = Category.new
    end

    # GET /categories/1/edit
    def edit
    end

    # POST /categories
    def create
      @category = Category.new(category_params)

      if @category.save
        redirect_to( {action: :index},  :notice=> create_notice )
      else
        render :new
      end
    end

    # PATCH/PUT /categories/1
    def update
      if @category.update(category_params)
        redirect_to( {action: :index},  :notice=> update_notice )
      else
        render :edit
      end
    end

    # DELETE /categories/1
    def destroy
      @category.destroy
      redirect_to( {action: :index},  :notice=> destroy_notice )
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_category
        @category = Category.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def category_params
        params.require(:category).permit(:name, :color)
      end

  end
end
