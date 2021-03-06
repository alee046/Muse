class UsersController < ApplicationController

  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy

  def index
    @users = User.paginate(page: params[:page])

  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "You have successfully signed up!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
    flash[:success] = "Profile updated"
    redirect_to @user
  else
    render 'edit'
    end
  end

  def show
 @user = User.find(params[:id])
 @posts = Post.paginate(:page => params[:page], :per_page => 5)
  end

  private
    #

    def user_params
      params.require(:user).permit(:user_name, :email, :password, :password_confirmation)
    end

    #confirms logged in user
    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    #confirms correct user
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless @user == current_user
    end
    #confirms admin user
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

end
