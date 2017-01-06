class UsersController < ApplicationController

  def index
    #@users = User.all
    @users=User.paginate(:page => params[:page], :per_page => 6)
  end

  def show
    @user = User.find(params[:id])
  end
  
  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page], :per_page => 6)
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page], :per_page => 6)
    render 'show_follower'
  end

end
