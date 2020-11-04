class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:show, :edit, :create]
  before_action :move_to_top_page, only: [:edit, :destroy]
  before_action :set_item, only: [:edit, :show, :update]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path, notice: '登録が完了しました'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    redirect_to action: :index if @item.destroy
  end

  private

  def item_params
    params.require(:item).permit(:name, :text, :category_id, :item_status_id, :delivery_charge_id, :prefecture_id, :shopping_day_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_top_page
    @item = Item.find(params[:id])

    redirect_to action: :index if user_signed_in? && @item.user_id != current_user.id
  end
end
