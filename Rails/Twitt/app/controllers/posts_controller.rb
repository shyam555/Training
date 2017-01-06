class PostsController < ApplicationController
  def index
    @posts = Post.paginate(:page => params[:page], :per_page => 5)
    @post = Post.new
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.paginate(page: params[:page])
  end

  def create
    @user = User.find(current_user.id)
    @post = @user.posts.create(post_params)
    if @post.save
      redirect_to posts_path 
    else
      flash[:error] = "Empty tweet..!"
      redirect_to posts_path
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def show_images
    @posts = Post.all
  end

  private
  def post_params
    params.require(:post).permit(:content, :picture)
  end
end