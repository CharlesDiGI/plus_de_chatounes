class GoodOrdersController < ApplicationController
  def new
    @order = GoodOrder.new
  end

  def index
    @orders = GooddOrder.all
  end

  def show
    @order = GoodOrder.find(params[:id])
  end

  def create
    @order = GoodOrder.new(order_params)
    @current_cart.join_table_line_items.each do |item|
      @order.line_items << item
      item.cart_id = nil
    end
    @order.save
    Cart.destroy(session[:cart_id])
    session[:cart_id] = nil
    redirect_to root_path
  end


  private
  def order_params
    params.require(:order).permit(:name, :email, :address, :pay_method)
  end

end
