class OrdersController < ApplicationController
  
  before_action :authenticate_user!
  before_action :my_items
  before_action :sold_out

  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      return redirect_to root_path
    else
      @order_address = OrderAddress.new
      render 'index'
    end
  end
  
  def my_items
    @item = Item.find(params[:item_id])
    redirect_to root_path unless @item.user != current_user
  end


  def sold_out
    @item = Item.find(params[:item_id])
     if @item.order.present?
      redirect_to root_path
     end
  end

 

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :municipality, :street_number, :building, :phone_number, :item_id).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
    Payjp::Charge.create(
    amount: @item.price,  
    card: order_params[:token],
    currency: 'jpy'
   )
  end

end
