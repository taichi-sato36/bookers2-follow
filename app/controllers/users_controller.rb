class UsersController < ApplicationController
		before_action :authenticate_user!
  def index
  	@users = User.all
  	@newbook = Book.new
  end

  def show
  	@newbook = Book.new
  	@user = User.find(params[:id])
  	@books = @user.books
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
  	flash[:notice] = "You have updated user successfully."
  		redirect_to user_path(@user.id)
	    else
	    	render "edit"
	    end
  end

  def edit
  	@user = User.find(params[:id])
  	if @user.id != current_user.id
  		redirect_to user_path(current_user.id)
  	end
  end


  def follows
    @user = User.find(params[:id])
    @users = @user.followings
    render 'follows'
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers
    render 'followers'
  end


 private
 def user_params
 	params.require(:user).permit(:name, :profile_image, :introduction)
 end

end


