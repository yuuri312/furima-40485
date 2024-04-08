 class ItemsController < ApplicationController
    # before_action :set_item, only: [:show, :edit, :update, :destroy]
    before_action :move_to_login, except: [:index]

    def index
      @items = Item.all.order(created_at: :desc)
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
      params.require(:item).permit(:name, :description, :category_id, :condition_id, :paid_shipping_cost_id, :prefecture_id, :due_date_id, :price, :image).merge(user_id: current_user.id)
    end
  
    # def set_item
    #   @item = Item.find(params[:id])
    # end

    def move_to_login
      unless user_signed_in?
        redirect_to new_user_session_path
      end
    end
end
