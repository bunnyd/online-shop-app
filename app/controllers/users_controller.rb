class UsersController < ApplicationController
  before_action :set_user, only: [:index, :show, :edit, :update, :destroy]
  before_action :redirect_if_not_logged_in, only: [:show]


  def index
    @users = User.all

  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    # byebug

      # byebug
    if @user.valid?
      @user.save
      # byebug
      session[:user_id] = @user.id
      #create cart for user
      @user.cart = Cart.create(user: current_user)

      #if seller, create inventory for user
      if @user.is_seller
        @user.inventory = Inventory.create(seller: current_user)
      end

      redirect_to @user
    else
      flash[:error] = @user.errors.full_messages[0]
      redirect_to signup_path
    end
  end


  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      flash[:error] = @user.errors.full_messages[0]
      render :edit
    end
  end

  def destroy
    @user.destroy

    redirect_to users_path
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :email, :first_name, :last_name, :credit_card_number, :is_seller)
  end
end
