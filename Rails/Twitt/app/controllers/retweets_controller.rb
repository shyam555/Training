class RetweetsController < ApplicationController
  def new
    @user = User.find(current_user.id)
    @post = Post.find(params[:id])
    @retweet = @post.retweets.build
  end

  def create
    @user = User.find(current_user.id)
    @post = Post.find(params[:id])
    @retweet = @post.retweets.build(retweet_permit)
    if @retweet.save
      redirect_to posts_path
    else
      render 'new'
    end
  end
  def show
    @post = Post.find(params[:id])
    @retweet = Post.find(params[:id])
  end

  private
  def retweet_permit
    params.require(:post).permit(:retweet_id,:content).merge(user_id: current_user.id )
  end
end
