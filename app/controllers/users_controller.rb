class UsersController < ApplicationController

  def index
   @users = User.all
  end

  def new
   @user = User.new
  end

  def show
  end

  def create
   @user = User.new(params[:user].permit(:login, :email, :password,  :password_confirmation))

    if @user.save
      #redirect_to @user
      flash[:status] = TRUE
      flash[:alert] = 'OK'
      redirect_to @user
    else
      flash[:status] = FALSE
      flash[:alert] = @user.errors.full_messages
      redirect_to register_path
    end
  end

 def update
   @user = User.find(current_user.id) 
    #@user && @user.authenticate(params[:passwords])  # &&
  if  @user.update(params[:user].permit(:password, :password_confirmation))
    redirect_to profile_path
  else
    redirect_to profile_edit_path
    flash[:alert] = @user.errors.full_messages
  end
 end
end
