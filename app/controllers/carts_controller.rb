# frozen_string_literal: true

class CartsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_cart
  before_action :set_cart, only: %i[show edit update destroy]

  # GET /carts
  # GET /carts.json
  def index
    @carts = Cart.all
  end

  # GET /carts/1
  # GET /carts/1.json
  def show
    # @cart = Cart.find_by(id: current_user&.cart&.id)
    # @rooms = current_user&.rooms
    # @chat_rooms = @rooms&.select do |room|
    #   User.find_by(id: room.entries.first.user_id).name != current_user.name
    # end
    #
    # @line_items = @cart.line_items
    # @users = @line_items.map{ |line_item| line_item.information.user }
    #
    # @line_items.each do |item|
    #   @user = item.information.user
    # end
    #
    @currentUserEntry = Entry.where(user_id: current_user.id)
    # @userEntry = Entry.where(user_id: @user&.id)
    #
    @room = Room.new
    @entry = Entry.new
    @isRoom = false

    # unless @user&.id == current_user.id
    #   @currentUserEntry.each do |cu|
    #     @userEntry.each do |u|
    #       if cu.room_id == u.room_id
    #         @isRoom = true
    #         @roomId = cu.room_id
    #       end
    #     end
    #   end
    #   if @isRoom
    #   else
    #     @room = Room.new
    #     @entry = Entry.new
    #   end
    # end
  end

  # GET /carts/new
  def new
    @cart = Cart.new
  end

  # GET /carts/1/edit
  def edit; end

  # POST /carts
  # POST /carts.json
  def create
    @cart = Cart.new(cart_params, user: current_user)
    respond_to do |format|
      if @cart.save
        format.html { redirect_to @cart, notice: 'リストの作成に成功しました' }
        format.json { render :show, status: :created, location: @cart }
      else
        format.html { render :new }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /carts/1
  # PATCH/PUT /carts/1.json
  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to @cart, notice: 'Cart was successfully updated.' }
        format.json { render :show, status: :ok, location: @cart }
      else
        format.html { render :edit }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carts/1
  # DELETE /carts/1.json
  def destroy
    @cart.destroy if @cart.id == session[:cart_id]
    session[:cart_id] = nil
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Cart was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_cart
    @cart = Cart.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def cart_params
    params.fetch(:cart, {})
  end

  def invalid_cart
    logger.error "Attempt to access invalid cart #{params[:id]}"
    redirect_to root_path, notice: "That cart doesn't exist"
  end
end
