class UsersController < ApplicationController
   before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
   before_action :correct_user,   only: [:edit, :update]

 
  
  def show
  @user = User.find(params[:id])
  @bookmarks = Bookmark.where(user_id: @user.id).all
  @current_user = current_user
  end 
 
  def new
    @user = User.new
  end
  
  def create
  @user = User.new(user_params)
  if @user.save
    log_in @user
    flash[:success] = "Welcome to the Map.inc"
    redirect_to @user
  else
   render 'new'
  end
  end
  
    def destroy

  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "プロフィールを更新しました"
      redirect_to @user
    else
      render 'edit'
   end
  end
  
 
  
  private
  
  def user_params
   params.require(:user).permit(:name, :email, :password, :phone_number,
   :address, :password_confirmation)
  end
  
  def logged_in_user
    unless logged_in?
    store_location
    flash[:danger] = "ログインしてください"
    redirect_to login_url
  end
 end  
 
     def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless @user == current_user
    end
    
end