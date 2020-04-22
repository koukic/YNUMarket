class InformationController < ApplicationController
  before_action :set_information, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_room, only: %i[index show]
  # GET /information
  # GET /information.json
  def index
    # @user = User.find(1)
    if params[:tag_name]
      @informations = Information.tagged_with("#{params[:tag_name]}").order(:id).page params[:page]
    else
      @informations = Information.order(created_at: :desc).page params[:page]
    end

    @information_furima = Information.tagged_with("フリマ").order(created_at: :desc).page params[:page]
    @information_service = Information.tagged_with("サービス").order(created_at: :desc).page params[:page]
    @information_circle = Information.tagged_with("サークル").order(:id).page params[:page]
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

    if @information.tag_list == ['フリマand教科書']
      @information.tag_list = ['フリマ','教科書']
    elsif @information.tag_list == ['フリマand本・漫画']
      @information.tag_list = ['フリマ', '本・漫画']
    elsif @information.tag_list == ['フリマandインテリア・家具']
      @information.tag_list == ['フリマ', 'インテリア・家具']
    elsif @information.tag_list == ['フリマandスポーツ']
      @information.tag_list = ['フリマ', 'スポーツ']
    elsif @information.tag_list == ['フリマandその他']
      @information.tag_list = ['フリマ', 'その他']
    elsif @information.tag_list == ['サービス']
      @information.tag_list = ['サービス']
    elsif @information.tag_list == ['サークルandサークル・スポーツ']
      @information.tag_list = ['サークル', 'サークル・スポーツ']
    elsif @information.tag_list == ['サークルandサークル・文化系']
      @information.tag_list = ['サークル', 'サークル・文化系']
    end

    respond_to do |format|
      if @information.save
        format.html { redirect_to @information, notice: '投稿することを成功しました' }
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
      format.html { redirect_to information_index_url, notice: '投稿が削除されました' }
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

    def set_room
      @cart = Cart.find_by(id: current_user&.cart&.id)
      @rooms = current_user&.rooms
      @chat_rooms = @rooms&.select do |room|
        User.find_by(id: room.entries.first.user_id).name != current_user.name
      end
    end
end
