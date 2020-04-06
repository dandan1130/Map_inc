class ParksController < ApplicationController
 
  def index
   
       @parks = Park.paginate(page: params[:page], per_page: 5)
       @park_lists = Park.search(params[:search])
  end
  
  def show
  @park = Park.find(params[:id])
  @park_shops = Shop.all
     @hash = Gmaps4rails.build_markers(@park) do |park, marker|
      marker.lat park.latitude
      marker.lng park.longitude
      marker.infowindow park.park_title
  
end  
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
                               :latitude,
                               :longitude,
                               :park_category,
                               :park_image, 
                               :park_url,
                            
)
end
 
end