class Admin::ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :is_admin?

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def edit
    @item = Item.find(params[:id])
  end

  def create
    if params[:item][:image].present?
      @item = Item.new(item_params)
      @item.image_url = url_for(@item.image)
      @item.image.attach(params[:item][:image])
      if @item.save
        redirect_to admin_item_path(@item.id)
      else
        render :new
      end
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admin_item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to admin_items_path, notice: "L'item a bien été supprimé."
  end


  private
  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:title, :description, :price, :image, :category_id)
  end
end
