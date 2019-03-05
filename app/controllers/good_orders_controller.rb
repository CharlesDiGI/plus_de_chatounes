class GoodOrdersController < ApplicationController
  def new
    @order = GoodOrder.new
  end

  def index
    @orders = GoodOrder.all
  end

  def show
    @order = GoodOrder.find(params[:id])
  end

  def create
    @order = GoodOrder.new(user: current_user) #(order_params)
    puts @order
    # @order.items = []
    @current_cart.items.each do |item|
      @order.items << item
      # item.cart_id = nil
    end
    @order.save
    @current_cart.destroy
    session[:cart_id] = nil
    redirect_to root_path
  end


  private
  def order_params
    params.require(:order) #.permit(:name, :email, :address, :pay_method)
  end

end
