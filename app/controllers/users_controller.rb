class UsersController < ApplicationController
  before_action :set_user, only: [:index, :show, :edit, :update, :destroy]
  before_action :redirect_if_not_logged_in, only: [:index]


  def index

  end

  def show
  end

  def new
  end

  def create
    @user = User.new(user_params)

    if @user.is_seller == true
      @user.inventory = Inventory.create(seller: current_user)
      # byebug
      if @user.valid?
        @user.save
        redirect_to @user
      else
        render :new
      end
    end
  end


  def edit
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :email, :first_name, :last_name, :credit_card_number, :is_seller)
  end
end
