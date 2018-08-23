class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :edit, :update, :destroy]

  def index

  end

  def show
    @user = User.find(session[:user_id])
  end

  def create
    # product = Product.find(params[:product_id])
    # @cart_product = @cart.add_product(product.id)
    # if @cart_product.valid?
    #   @cart_product.save
    # else
    #   redirect_to
    # end

  end

  def edit
  end

  def update
  end

  private
  def set_cart
    @cart = Cart.find(session[:user_id])
  end

  def cart_params
  # byebug
  params.require(:cart).permit(:user_id, product_ids:[])
  end

end
