class ItemsController < ApplicationController
  
  def index
  end

  def new
    @user = User.new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  def destroy
  end

  
end
