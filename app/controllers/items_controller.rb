 class ItemsController < ApplicationController
    before_action :set_item, only: [:show, :edit, :update, :destroy]
  
    def index
      @items = Item.includes(:item_images)
    end
end
