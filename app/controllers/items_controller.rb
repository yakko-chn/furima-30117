class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:create]

  def index
    # @items = Item.order("created_at DESC")
    @items = Item.all
  end

  def new
    @item = Item.new    
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path, notice: "登録が完了しました"
    else
      @item.valid?
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:name,:text,:category_id,:item_status_id,:delivery_charge_id,:prefecture_id,:shopping_day_id,:price,:image).merge(user_id: current_user.id)
  end
end
