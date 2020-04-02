class ParksController < ApplicationController
 
  def index
  end
  def show
  @park = Park.find(params[:id])
  @posts = @user.posts
  end

  def new
   @park = Park.new
  end

  def create
     @park = Park.new(park_params)
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
  
  private
  
  def park_params
  params.require(:park).permit(:park_title, 
                               :park_discription, 
                               :park_phone_number, 
                               :station, 
                               :east,
                               :west,
                               :park_image, 
                               :park_url,
                            
)
 end
  
end
