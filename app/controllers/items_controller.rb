class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit,  :destroy]
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :move_to_edit, only: [:edit, :destroy]
  def index
    @items = Item.all.order(created_at: :desc)
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

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:title, :image, :price, :delivery, :commodity_condition_id, :shipping_charge_id,
                                 :region_of_origin_id, :days_to_ship_id, :category_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_edit
    redirect_to root_path unless current_user == @item.user
  end
end
