class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item, only: [:index,:create]
  before_action :move_to_top_page,:no_item
 
  def index
    @order_address_form = OrderAddressForm.new
  end

  def new
  end

  def create
    @order_address_form = OrderAddressForm.new(address_params)
    # 上記のインスタンス変数で、情報を取得。
    if @order_address_form.valid?
      order_pay
      @order_address_form.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def address_params
    # 送られてきた情報(params)からpermit分を取得する
    # order_address_form.rbのアクセッサーの値と同じでないと取得できない。
    params.permit(:post_number, :prefecture_id, :city, :address, :building, :phone_number, :item_id).merge(user_id: current_user.id, token: params[:token])
  end

  def order_pay
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: address_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_top_page
   if user_signed_in? && @item.user_id == current_user.id
    redirect_to root_path
   end
  end

  def no_item
    if @item.order != nil
      redirect_to root_path
    end
  end
end
