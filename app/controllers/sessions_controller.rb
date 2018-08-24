class SessionsController < ApplicationController
  def new
  end

  def create
    # find the user with that username
    user = User.find_by(email: params[:email])

    # check if password is legit
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      byebug

      redirect_to user_path(user)
    else
      flash[:error] = "Invalid email/password. Try again."
      render :login
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end
end
