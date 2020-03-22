module CurrentCart
  # private def set_cart
  #   @cart = Cart.find(session[:cart_id])
  # rescue ActiveRecord::RecordNotFound
  #   @cart = Cart.create
  #   session[:cart_id] = @cart.id
  # end

  private def set_cart
    if session[:cart_id].present?
      binding.pry
      @cart = Cart.find(session[:cart_id])
    else
      binding.pry
      @cart = Cart.create
      @cart.user = current_user
      session[:cart_id] = @cart.id
    end
  end

end
