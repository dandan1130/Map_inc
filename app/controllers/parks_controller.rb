class ParksController < ApplicationController
 
  def index
       @park_lists = Park.search(params[:search])
       @parks = Park.all.includes(:user).recent
  end
  
 def show
   @park = Park.find(params[:id])
   @bookmark = current_user.bookmarks.new
   result = Shop.new
   @shops = Shop.all.includes(:park).recent
  if params[:search].present? 
   @park_shops = Shop.search(park_id: params[:id], shop_search: params[:search])
  else
   @park_shops = Shop.where(park_id: params[:id])
  end
 end

  def new
   @park = Park.new
  end

  def create
     @park = current_user.parks.new(park_params)
     if @park.save
       flash[:success] = "Build the Park！"
     redirect_to @park
     else
      render 'new'
     end
  end

  def edit
  end
  def destroy
    
  end
  def bookmarks
    @bookmark_parks = current_user.bookmarks.includes(:user).recent
  end
  
  def edit 
   @park = Park.find(params[:id])
  end
  
    def update
    @park = Park.find(params[:id])
    if current_user == @user || current_user.admin?
      flash[:success] = "プロフィールを更新しました"
      redirect_to @park
  end
  end

  
  private
  
  def park_params
  params.require(:park).permit(:park_title, 
                               :park_discription, 
                               :park_phone_number, 
                               :station, 
                               :latitude,
                               :longitude,
                               :park_category,
                               :park_image, 
                               :park_url,
                               :user_id,
                               :park_address
                               )
  end
 
end