class ProductsController < ApplicationController
  before_action :current_product, only: [:show, :edit, :update]

  def index
    @products = Product.all
  end

  def show
  end

  def edit
  end

  def update
    if @product.update_attributes(product_params)
      redirect_to product_path(@product)
    else
      render :edit
    end
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save!
      redirect_to seller_inventories
    else
      flash[:errors] = @product.errors.full_messages[0]
      render :new
    end
  end

  private
  def product_params
    params.require(:product).permit(:name, :price, :description, :seller_id,:inventory_id, :image_url)
  end

  def current_product
    @product = Product.find(params[:id])
  end
end
