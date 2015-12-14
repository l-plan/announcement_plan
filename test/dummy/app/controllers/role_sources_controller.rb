class RoleSourcesController < ApplicationController
  before_action :set_role_source, only: [:show, :edit, :update, :destroy]

  # GET /role_sources
  # GET /role_sources.json
  def index
    @role_sources = RoleSource.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @role_sources }
    end
  end

  # GET /role_sources/1
  # GET /role_sources/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @role_source }
    end
  end

  # GET /role_sources/new
  def new
    @role_source = RoleSource.new
  end

  # GET /role_sources/1/edit
  def edit
  end

  # POST /role_sources
  # POST /role_sources.json
  def create
    @role_source = RoleSource.new(role_source_params)

    respond_to do |format|
      if @role_source.save
        format.html { redirect_to @role_source, notice: 'Role source was successfully created.' }
        format.json { render json: @role_source, status: :created }
      else
        format.html { render action: 'new' }
        format.json { render json: @role_source.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /role_sources/1
  # PATCH/PUT /role_sources/1.json
  def update
    respond_to do |format|
      if @role_source.update(role_source_params)
        format.html { redirect_to @role_source, notice: 'Role source was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @role_source.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /role_sources/1
  # DELETE /role_sources/1.json
  def destroy
    @role_source.destroy
    respond_to do |format|
      format.html { redirect_to role_sources_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_role_source
      @role_source = RoleSource.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def role_source_params
      params.require(:role_source).permit(:naam)
    end
end
