class ApplicationController < ActionController::Base
  # private
  # def after_sign_in_path_for(resource)
  #   @cart = Cart.find(session[:cart_id])
  # rescue ActiveRecord::RecordNotFound
  #   @cart = Cart.create
  #   session[:cart_id] = @cart.id
  # end
  # def after_sign_out_path_for(resource)
  #   @cart = Cart.create
  #   session[:cart_id] = @cart.id
  #   root_path
  # end
end
