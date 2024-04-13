class PurchaseHistoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :sold
  before_action :items_user
  
  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @purchase_history_address = PurchaseHistoryAddress.new
  end

  def create 
    @purchase_history_address = PurchaseHistoryAddress.new(purchase_params)
    if @purchase_history_address.valid?
      pay_item
      @purchase_history_address.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end
    

  private

  def purchase_params
    params.require(:purchase_history_address).permit(:postal_code, :prefecture_id, :city, :block, :building, :tel).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: params[:token],
      currency: 'jpy'
    )
  end

  def sold
    @item = Item.find(params[:item_id])
    if @item.purchase_history.present?
      redirect_to root_path
    end
  end

  def items_user
    if current_user.id == @item.user.id
      redirect_to root_path
    end
  end
end
