class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]

  def index
    @order = StreetAddress.new
    if user_signed_in? && current_user.id == @item.user_id
      return redirect_to root_path
    end
  end

  def create
    @order = StreetAddress.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private
  def set_item
    @item = Item.find(params[:item_id])
    redirect_to root_path if @item.order.present?
  end

  def order_params
    params.permit(:postal_code, :shipping_area, :city, :address_detail, :apartment_name, :phone_number, :token, :item_id).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
    Payjp::Charge.create(
      amount: @item.price, 
      card: params[:token],
      currency:'jpy'
    )
  end
end
