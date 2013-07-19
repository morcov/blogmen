class PostsController < ApplicationController

  def new
   @post = Post.new
   #@user = User.find(params[:user])
  end

  def index
    #@posts = Post.paginate :page => params[:page], :per_page => 5, :order => 'position'
   #@posts = Post.find(:all, :order => "created_at DESC")
   @posts = Post.all

  end

  def create
   if current_user
    @post = Post.new(params[:post].permit(:title, :text))
    @post.user_id = current_user.id
 
    @post.save
    redirect_to @post
   else
    #render "/../log_in"
    #redirect_to "sessions#new"
    redirect_to root_url
   end
  end

  def show
   @post = Post.find(params[:id])
  end
  
  def edit
  # @post = current_user.posts.find(params[:id])

   if current_user.posts.find(params[:id])
     @post = Post.find(params[:id])
   else
     redirect_to posts_path
   end
   
  end

def update
   @post = Post.find(params[:id])
 
  if @post.update(params[:post].permit(:title, :text))
    redirect_to @post
  else
    render 'edit'
  end
 end

 def destroy
 # if 
    @post = current_user.posts.find(params[:id])
    #@post = Post.find(params[:id])
    @post.destroy
 # end
  redirect_to posts_path
 end

 def sort
  params[:post].each_with_index do |id, index|
    Post.update_all(['position=?', index+1], ['id=?', id])
  end
  render :nothing => true
end

end
