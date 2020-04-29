class BookmarksController < ApplicationController
 attr_accessor :park_id
 before_action :correct_user,   only: :destroy
 def index
   @bookmarks = Bookmark.where(user_id: params[:user_id])
   
 end
 
  def create
    if current_user.bookmarks.find_by(park_id: params["bookmark"]["park_id"].to_i).present?
      redirect_to user_path(params[:user_id]) 
    else
      bookmark = current_user.bookmarks.build(park_id: params["bookmark"]["park_id"].to_i)
      bookmark.save!
     
    end
  end


  def destroy
    current_user.bookmarks.find_by(park_id: params["bookmark"]["park_id"].to_i).destroy
    redirect_to parks_path, success: t('.flash.not_bookmark')
  end
  
  def park_params
    params.permit(:park_id,
                  :user_id
  )
    end

     def correct_user
      @user = User.find(params[:user_id])
      redirect_to(root_url) unless @user == current_user
    end
end