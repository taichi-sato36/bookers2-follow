class RelationshipsController < ApplicationController



	def create
		@user = User.find(params[:user_id])
		current_user.follow(@user)
		respond_to do |format|
		    format.html { redirect_to @user }
		    format.js
		end
	end

	def destroy
		@user = User.find(params[:user_id])
		current_user.unfollow(@user)
		respond_to do |format|
		    format.html { redirect_to @user }
		    format.js
		end
	end



def follower
    @user = User.find(params[:id])
    @users = @user.followings
  end

  def followed
    @user = User.find(params[:id])
    @users = @user.followers
  end











end
