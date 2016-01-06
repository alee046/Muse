class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "You are logged in!"
      redirect_to user
    else
      flash[:danger] = 'Invalid login credentials - try again!'
      render 'new'
    end
  end

  def destroy
  session[:user_id] = nil
  redirect_to root_path
  flash[:danger] = 'You have logged out!'
  end
end
