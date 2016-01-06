class StaticPagesController < ApplicationController

  def home
    @posts = current_user.posts.build if logged_in?
  end

  def help
  end
end
