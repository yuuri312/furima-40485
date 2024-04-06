 class ItemsController < ApplicationController
    before_action :set_item, only: [:show, :edit, :update, :destroy]
  
    def index
      @items = Item.includes(:item_images)
    end
    
    def new
      @item = Item.new
    end

    def create
      @item = Item.new(item_params)
      if @item.save
        redirect_to root_path
      else
        render :new, status: :unprocessable_entity
      end
    end
  
    private
  
    def item_params
      params.require(:item).permit(:name,:description,:category_id,:condition_id,:paid_shipping_cost_id,:prefecture_id,:due_date_id,:price)
    end
end
