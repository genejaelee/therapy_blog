class PostsController < ApplicationController
  def new
  end
  
  def create
    @post = Post.create(post_params)
    
    redirect_to '/'
  end
  
  def index
    @post = Post.new
    @posts = Post.all.reverse
  end
  
  def toggle_like
    @post = Post.find_by(id: params[:post_id])
    @current_user = User.find_by(id: params[:user_id])
    if like = @current_user.post_likes.find_by(post_id: @post.id)
      like.destroy
      render :json => { :status => 'unliked', :count => @post.post_likes.count }
    else
      like = @current_user.post_likes.build(:post_id => @post.id, :user_id => @current_user.id)
      like.save
      render :json => { :status => 'liked', :count => @post.post_likes.count }
    end
  end
  
  def post_comment
    @post = Post.find_by(id: params[:post_id])
    @current_user = User.find_by(id: params[:user_id])
    text = params[:text]
    first_name = @current_user.first_name
    comment = @post.post_comments.build(:post_id => @post.id, :user_id => @current_user.id, :text => text)
    comment.save
    render :json => { :status => 'commented', :count => @post.post_comments.count, :text => text, :first_name => first_name }
  end
  
  private
  
  def post_params
    params.require(:post).permit(:text, :user_id, :image, :image_caption)
  end
end
