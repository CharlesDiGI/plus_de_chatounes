class ChargesController < ApplicationController
	def new
	end

	def create
	  # Amount in cents
	  @amount = params[:cart_amount]

	  customer = Stripe::Customer.create({
	    email: params[:stripeEmail],
	    source: params[:stripeToken],
	  })

	  charge = Stripe::Charge.create({
	    customer: customer.id,
	    amount: @amount,
	    description: 'Rails Stripe customer',
	    currency: 'usd',
	  })

	if charge.paid
		@order = Order.create(user: current_user) #(order_params)
    # @order.items = []
    @current_cart.items.each do |item|
      OrderItem.create(item: item, order: @order)
      # item.cart_id = nil
    end

    # send emails after creation of Order and OrderItem
    OrderMailer.order_recap(@order).deliver_now
    OrderMailer.inform_admin(@order).deliver_now

    @current_cart.destroy
    session[:cart_id] = nil
    redirect_to root_path
	end

	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to new_charge_path
	end

end
