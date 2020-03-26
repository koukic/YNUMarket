module CurrentCart
  # private def set_cart
  #   @cart = Cart.find(session[:cart_id])
  # rescue ActiveRecord::RecordNotFound
  #   @cart = Cart.create
  #   session[:cart_id] = @cart.id
  # end

  private def set_cart
    if session[:cart_id].present?
      @cart = Cart.find(session[:cart_id])
    else
      @cart = Cart.create(user: current_user)
      session[:cart_id] = @cart.id
    end
  end

end
