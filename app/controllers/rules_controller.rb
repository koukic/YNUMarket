class RulesController < ApplicationController
  before_action :set_room
  def privacy
  end

  def service_terms
  end

  def buy_guide
  end

  def sell_guide
  end

  private
  def set_room
    @cart = Cart.find_by(id: current_user&.cart&.id)
    @rooms = current_user&.rooms
    @chat_rooms = @rooms&.select do |room|
      User.find_by(id: room.entries.first.user_id).name != current_user.name
    end
  end
end
