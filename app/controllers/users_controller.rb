class UsersController < ApplicationController
  def show
    @user = user.find(parms[:id])
    @post_images = @user.post_images.page(params[:page]).reverse_order
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = user.find(params[:id])
    @user = user.update(user_params)
    redirect_to user_path(@user.id)
  end
  private
  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
  
end
