class RulesController < ApplicationController
  def privacy
    @cart = Cart.find_by(id: current_user&.cart&.id)
  end
end
