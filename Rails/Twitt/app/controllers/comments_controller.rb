class CommentsController < ApplicationController

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @user = User.find(current_user.id)
    @post = Post.find(params[:post_id]) 
    @comment = @post.comments.build(comment_params)
    @comment.user_id = @user.id
    if @comment.save
      redirect_to new_post_comment_path
    else
      render 'new'
    end
  end
  def show
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
  end
  protected
   def comment_params
    params.require(:comment).permit(:content)
   end    

end
