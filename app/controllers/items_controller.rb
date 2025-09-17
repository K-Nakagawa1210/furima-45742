class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.includes(:user).order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def show
  end

  def create
    @item = current_user.items.build(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new,status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def item_params
    params.require(:item).permit(
      :product_name, :description, :price,
      :category_id, :condition_id, :shipping_fee_id, :prefecture_id, :shipping_day_id,
      :image
    )
  end  

  def set_item
    @item = Item.find(params[:id])
  end

end
