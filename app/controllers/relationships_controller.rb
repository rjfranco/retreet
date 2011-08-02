class RelationshipsController < ApplicationController
  before_filter :authenticate
  
  def create
    user = User.find(params[:relationship][:followed_id])
    current_user.follow!(user)
    redirect_to user, :flash => { :success => "You're now following #{user.name}"}
  end
  
  def destroy
    relationship = Relationship.find(params[:id]).destroy
    redirect_to relationship.followed, :flash => { :notice => "You're no longer following #{relationship.followed.name}"}
  end
end