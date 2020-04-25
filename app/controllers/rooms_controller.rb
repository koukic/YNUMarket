class RoomsController < ApplicationController
  before_action :authenticate_user!
  def index
    @cart = Cart.find_by(id: current_user&.cart&.id)
    @rooms = current_user&.rooms
    @chat_rooms = @rooms&.select do |room|
      User.find_by(id: room.entries.first.user_id).name != current_user.name
    end
  end

  def show
    @cart = Cart.find_by(id: current_user&.cart&.id)
    @rooms = current_user&.rooms
    @chat_rooms = @rooms&.select do |room|
      User.find_by(id: room.entries.first.user_id).name != current_user.name
    end
    @room = Room.find(params[:id])
    if Entry.where(user_id: current_user.id, room_id: @room.id).present?
      @messages = @room.messages.order(:id)
      @entries = @room.entries
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def create
    @room = Room.create
    @entry1 = Entry.create(room_id: @room.id, user_id: current_user.id)
    @entry2 = Entry.create(params.require(:entry).permit(:user_id, :room_id).merge(room_id: @room.id))
    redirect_to "/rooms/#{@room.id}"
  end
end
