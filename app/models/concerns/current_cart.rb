module CurrentCart
  # private def set_cart
  #   @cart = Cart.find(session[:cart_id])
  # rescue ActiveRecord::RecordNotFound
  #   @cart = Cart.create
  #   session[:cart_id] = @cart.id
  # end

  private def set_cart
    if current_user.cart.present?
      @cart = Cart.find_by(id: current_user&.cart&.id)
    else
      @cart = Cart.create(user: current_user)
    end
  end

end
