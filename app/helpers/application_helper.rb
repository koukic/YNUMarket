module ApplicationHelper
  def cart_count_over_one
    if @cart.line_items.count > 0
      return "<span class='tag is-dark'>#{@cart.line_items.count}</span>".html_safe
    end
  end

  def room_count_over_one
    if current_user.rooms.count > 0
      chat_rooms = current_user.rooms&.select do |room|
        User.find_by(id: room.entries.first.user_id).name != current_user.name
      end
      return "<span class='tag is-dark'>#{chat_rooms.count}</span>".html_safe
    end
  end

  def cart_has_items
    return @cart.line_items.count > 0
  end
end
