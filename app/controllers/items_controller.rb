class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index]
  
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
  end

  def move_to_index
    unless user_signed_in?
      redirect_to user_session_path
    end
  end

private
  def item_params
    params.require(:item).permit(:image, :name, :detail, :category_id, :condition_id, :shipping_fee_id, :shipping_place_id, :prep_time_id, :price ).merge(user_id: current_user.id) 
  end
end
