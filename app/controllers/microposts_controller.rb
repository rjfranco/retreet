class MicropostsController < ApplicationController
  before_filter :authenticate
  
  def create
    @micropost = current_user.microposts.build(params[:micropost])
    if @micropost.save
      redirect_to root_path, :flash => { :success => 'Your Post Has Been Succesfully Created.'}
    else
      render 'pages/home'
    end
  end
  
  def destroy
  end
end