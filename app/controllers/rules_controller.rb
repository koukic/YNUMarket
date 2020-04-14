class RulesController < ApplicationController
  def privacy
    @cart = Cart.find_by(id: current_user&.cart&.id)
    @rooms = current_user&.rooms
    @chat_rooms = @rooms&.select do |room|
      User.find_by(id: room.entries.first.user_id).name != current_user.name
    end
  end

  def service_terms
    @cart = Cart.find_by(id: current_user&.cart&.id)
    @rooms = current_user&.rooms
    @chat_rooms = @rooms&.select do |room|
      User.find_by(id: room.entries.first.user_id).name != current_user.name
    end
  end
end
