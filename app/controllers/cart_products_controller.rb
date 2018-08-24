class CartProductsController < ApplicationController
  before_action :set_cart_product, only: [:show, :edit, :update, :destroy]
  before_action :redirect_if_not_logged_in, only: [:show]


  def index
    @cart_products = CartProduct.all
  end

  def show
    @user = User.find(session[:user_id])
  end

  def new
    @cart_product = CartProduct.new
  end

  def create
    # byebug
    @user = User.find(session[:user_id])
    product = Product.find(params[:product_id])
    # byebug
    @cart_product = @user.cart.add_product(product.id)
    # byebug
    if @cart_product.valid?
      @cart_product.save
      redirect_to @cart_product.cart
    else
      flash[:error] = @cart_product.errors.full_messages[0]
      render :new
    end

  end

  def edit
  end

  def update
    if @cart_product.update(cart_product_params)
      redirect_to @cart_product
    else
      render :edit
    end
  end

  def destroy
    # @cart_product = CartProduct.find(params[:id])
    @cart_product.destroy
    # byebug
    redirect_to cart_path(@cart_product.cart)
  end

  private
  def set_cart_product
    # byebug
    @cart_product = CartProduct.find(params[:id])

  end

  def cart_product_params
  # byebug
  params.require(:cart_product).permit(:product_id)
  end

end
