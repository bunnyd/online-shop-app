class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :edit, :update, :destroy]
  before_action :redirect_if_not_logged_in

  def index

  end

  def show
    @user = User.find(session[:user_id])
  end

  def create
  end

  def edit
  end

  def update
  end

  def checkout
    @user = current_user
    @cart = @user.cart
    purchase_info = @cart.checkout
    @confirmed_purchases = purchase_info[0]
    @final_total_price = purchase_info[1]
    @rejected_purchases = purchase_info[2]
    @cart.clean_cart
  end

  private
  def set_cart
    @cart = Cart.find(session[:user_id])
  end

  def cart_params
  params.require(:cart).permit(:user_id, product_ids:[])
  end

end
