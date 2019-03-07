class OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    #@order = Order.create(user: current_user) #(order_params)
    ## @order.items = []
    #@current_cart.items.each do |item|
      #OrderItem.create(item: item, order: @order)
      ## item.cart_id = nil
    #end

    ## send emails after creation of Order and OrderItem
    #OrderMailer.order_recap(@order).deliver_now
    #OrderMailer.inform_admin(@order).deliver_now

    #@current_cart.destroy
    #session[:cart_id] = nil
    #redirect_to root_path
  end


  private
  def order_params
    params.require(:order) #.permit(:name, :email, :address, :pay_method)
  end


end
