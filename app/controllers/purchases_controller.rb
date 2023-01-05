class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create, :edit]
  before_action :set_item, only: [:index, :create]
  before_action :move_to_index, only: [:edit, :index]
  def index
    @purchase_shipping = PurchaseShipping.new
  end

  def create
    @purchase_shipping = PurchaseShipping.new(item_params)
    if @purchase_shipping.valid?
      pay_item
      @purchase_shipping.save
      redirect_to root_path
    else
      render :index
    end
  end

  def edit
  end

  private

  def item_params
    params.require(:purchase_shipping).permit(:postal_code, :region_of_origin_id, :city, :addresses, :building, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @items.price,
      card: item_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @items = Item.find(params[:item_id])
  end

  def move_to_index
    redirect_to root_path if current_user == @items.user && !@items.purchase.nil?
  end
end
