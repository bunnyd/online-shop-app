class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def show
  end

  def new
  end

  def edit
  end
end
