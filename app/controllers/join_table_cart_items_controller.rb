class JoinTableCartItemsController < ApplicationController
	before_action :set_cart, only: [:create, :destroy]
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    # Find associated product and current cart
    chosen_item = Item.find(params[:item_id])
    current_cart = @current_cart
  
    # If cart already has this product then find the relevant line_item and iterate quantity otherwise create a new line_item for this product
    if !current_cart.items.include?(chosen_item)
      @join_table_cart_item = JoinTableCartItem.new
      @join_table_cart_item.cart = current_cart
      @join_table_cart_item.item = chosen_item
      @join_table_cart_item.save
    else
      flash[:error] = 'pix already in your cart'
    end
  
    # Save and redirect to cart show path
    #@join_table_cart_item.save
    redirect_to cart_path(@current_cart)
  end

  def destroy
    @join_table_cart_item = JoinTableCartItem.find(params[:id])
    @join_table_cart_item.destroy
    redirect_to cart_path(@current_cart.id)
  end
  
  private
    def join_table_cart_item_params
      params.require(:join_table_cart_item_params).permit(:item_id, :cart_id)
  end
end
