class ShopsController < ApplicationController
attr_accessor :park_name

def show
@shop = Shop.find(params[:id])
end

def new
      @shop = Shop.new
      @park = Park.all
end

def create
 
    xxx = Park.find(params[:park_id])
 @shop = xxx.shops.new(shop_params)
if @shop.save
    flash[:success] = "Open the Shop! "
    redirect_to @shop
else 
    render 'new'
end
end

def edit
end

private

    def shop_params
      params.permit( :park_id,
                                    :shop_name,
                                    :shop_discription,
                                    :shop_phone_nimber,
                                    :shop_image,
                                    :floor,
                                    :category
)
    end

end
