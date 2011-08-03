class RelationshipsController < ApplicationController
  before_filter :authenticate
  
  def create
    @user = User.find(params[:relationship][:followed_id])
    current_user.follow!(@user)
    respond_to do |format|
      format.html { redirect_to @user, :flash => { :notice => "You're now following #{@user.name}"} }
      format.js
    end
  end
  
  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow!(@user)
    respond_to do |format|
      format.html { redirect_to @user, :flash => { :notice => "You're no longer following #{@user.name}"} }
      format.js
    end
  end
end