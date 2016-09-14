class BrandsController < ApplicationController
  before_action :set_brand, only: [:show, :relations, :edit, :update, :destroy]

  def index
    @brands = Brand.all
  end

  def show
  end

  def relations
    locations = @brand.locations
    render json: {
      locations: present_relations(locations),
      order_types: present_relations(@brand.order_types),
      menu_items: present_relations(@brand.menu_items),
      day_parts: present_relations(locations.first.day_parts)
    }
  end

  def new
    @brand = Brand.new
  end

  def edit
  end

  def create
    @brand = Brand.new(brand_params)
    if @brand.save
      redirect_to @brand, notice: 'Brand was successfully created.'
    else
      render :new
    end
  end

  def update
    if @brand.update(brand_params)
      redirect_to @brand, notice: 'Brand was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @brand.destroy
    redirect_to brands_url, notice: 'Brand was successfully destroyed.'
  end

  private
    def set_brand
      @brand = Brand.find(params[:id])
    end

    def brand_params
      params.require(:brand).permit(:name)
    end

    def present_relations(relations)
      relations.map do |relation|
        {
          _id: relation.id,
          name: relation.name
        }
      end
    end
end
