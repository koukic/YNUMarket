class InformationController < ApplicationController
  before_action :set_information, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: [:index, :show]
  # GET /information
  # GET /information.json
  def index
    @cart = (session[:cart_id] ? Cart.find_by(id: session[:cart_id]) : nil)
    if params[:tag_name]
      @informations = Information.tagged_with("#{params[:tag_name]}").order(:id).page params[:page]
    else
      @informations = Information.order(:id).page params[:page]
    end

  end
  # GET /information/1
  # GET /information/1.json
  def show
    @information = Information.find(params[:id])
  end
  # GET /information/new
  def new
    @information = current_user.informations.build
    @information.information_images.build
  end
  # GET /information/1/edit
  def edit

  end
  # POST /information
  # POST /information.json
  def create
    temp_params = information_params
    images = temp_params.delete(:images)
    @information = current_user.informations.build(temp_params)
    images.each do |image|
      @information.information_images.new(image: image)
    end
    respond_to do |format|
      if @information.save
        format.html { redirect_to @information, notice: 'Information was successfully created.' }
        format.json { render :show, status: :created, location: @information }
      else
        format.html { render :new }
        format.json { render json: @information.errors, status: :unprocessable_entity }
      end
    end
  end
  # PATCH/PUT /information/1
  # PATCH/PUT /information/1.json
  def update
    respond_to do |format|
      if @information.update(information_params)
        format.html { redirect_to @information, notice: 'Information was successfully updated.' }
        format.json { render :show, status: :ok, location: @information }
      else
        format.html { render :edit }
        format.json { render json: @information.errors, status: :unprocessable_entity }
      end
    end
  end
  # DELETE /information/1
  # DELETE /information/1.json
  def destroy
    @information.destroy
    respond_to do |format|
      format.html { redirect_to information_index_url, notice: 'Information was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  def search
    @informations = Information.search(params[:q]).page(params[:page])
    render "index"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_information
      @information = Information.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def information_params
      params.require(:information).permit(:condition, :title, :description, :tag_list, :price, images: [])
    end
end
