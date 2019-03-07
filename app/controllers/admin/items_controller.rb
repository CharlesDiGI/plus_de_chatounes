class Admin::ItemsController < ApplicationController
    before_action :set_item, only: [:show, :edit, :update, :destroy]
    before_action :is_admin?

    def index
      @items = Item.all
    end

    def show
        @itm = Item.find(paramd[:id])
    end

    def new
      @item = Item.new
    end

    def edit
    end
 
    def create
      @item = Item.new(item_params)
      @item.image.attach(params[:item][:image])
      
        if @item.save
          redirect_to admin_item_path(@item.id)
        else
          render :new
        end
        
    end
  
    def update
      respond_to do |format|
        if @item.update(item_params)
          format.html { redirect_to @item, notice: 'Item was successfully updated.' }
          format.json { render :show, status: :ok, location: @item }
        else
          format.html { render :edit }
          format.json { render json: @item.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def destroy
      @item.destroy
      respond_to do |format|
        format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  
    private
      def set_item
        @item = Item.find(params[:id])
      end

      def item_params
        params.require(:item).permit(:title, :description, :price, image: {}) 
      end
end
