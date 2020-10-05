class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :my_items
  before_action :sold_out
  before_action :set_item, only: [:index, :create, :sold_out]

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render 'index'
      @order_address = OrderAddress.new
    end
  end

  def my_items
    @item = Item.find(params[:item_id])
    redirect_to root_path unless @item.user != current_user
  end

  def sold_out
    redirect_to root_path if @item.order.present?
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :municipality, :street_number, :building, :phone_number, :item_id).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
