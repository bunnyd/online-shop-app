class ProductsController < ApplicationController
  before_action :current_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
    @user = current_user
  end

  def show
  end

  def edit
    @user = current_user
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
    @user = current_user
  end

  def create
    # byebug
    @product = Product.new(product_params)

    if @product.save!
      redirect_to inventories_path
    else
      flash[:errors] = @product.errors.full_messages[0]
      render :new
    end
  end

  def destroy

    current_product.destroy
    redirect_to inventories_path
  end

  private
  def product_params
    params.require(:product).permit(:name, :price, :description, :quantity, :seller_id,:inventory_id, :image_url)
  end

  def current_product
    @product = Product.find(params[:id])
  end
end
