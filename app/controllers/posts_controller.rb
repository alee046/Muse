class PostsController < ApplicationController
before_action :logged_in_user, only: [:create, :destroy]
before_action :correct_user, only: :destroy
  def index
    @posts = Post.paginate(:page => params[:page], :per_page => 5)
 #/@posts = Post.all.includes(:likes).to_a.sort{|a,b| b.likes.count
  end

def create
  @posts = current_user.posts.build(post_params)
  if @posts.save
    flash[:success] = "Post saved!"
    redirect_to root_url
  else
    render 'static_pages/home'
  end
end

 def like
    post = Post.find(params[:id])
    like = Like.create(user_id: current_user.id, post_id: post.id)
    redirect_to user_path(current_user)
  end

def destroy
  @post.destroy
  flash[:success] = "Post deleted!"
  redirect_to request.referrer || root_url
end

private

def post_params
  params.require(:post).permit(:content)
end

  def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
    end
    def correct_user
      @post= current_user.posts.find_by(id: params[:id])
      redirect_to root_url if @post.nil?
    end
end
end
