class MenuItemsController < ApplicationController
  before_action :set_brand

  def show
    @menu_item = @brand.menu_items.find(params[:id])
  end

  def new
    @menu_item = MenuItem.new
  end

  def edit
    @menu_item = @brand.menu_items.find(params[:id])
  end

  def create
    @menu_item = @brand.menu_items.new(menu_item_params)
    if @menu_item.save
      redirect_to brand_path(@brand), notice: 'Menu Item was successfully created.'
    else
      render :new
    end
  end

  def update
    @menu_item = @brand.menu_items.find(params[:id])
    if @menu_item.update(menu_item_params)
      redirect_to brand_path(@brand), notice: 'Menu Item was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    menu_item = @brand.menu_items.find(params[:id])
    menu_item.destroy
    redirect_to brand_path(@brand)
  end

  private
    def set_brand
      @brand = Brand.find(params[:brand_id])
    end

    def menu_item_params
      params.require(:menu_item).permit(:name, :description, prices_attributes: [:id, :cost, :price_level_id, :_destroy])
    end
end
