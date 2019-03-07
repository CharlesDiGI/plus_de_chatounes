class CartsController < ApplicationController
	def show
		@cart = @current_cart
		@sum = sum(@cart)
		@items = Item.all
	end

	def destroy
		@cart = @current_cart
    @cart.destroy
    session[:cart_id] = nil
    redirect_to root_path
	end

end
