class CouponSearchController < ApplicationController
  def index
  	@coupons = Coupon.all
    @business= Business.all 

    
    respond_to do |format|
      format.html {
          render 'index'
      }
      format.json {render json: Coupon.order(sort_by + ' ' + order)}
    end

  end


 
 def search
  #method to find all coupons with the business id. it is going to be skipped to the coupon method that finds it by title 
      if Business.where("name LIKE '%#{params[:query]}%'").pluck(:id).present?
        business = Business.where("name LIKE '%#{params[:query]}%'").pluck(:id)
        coupons = Coupon.where(business_id: business)
        render json: coupons
      else
        #method that find coupons 
        coupon = Coupon.where("title LIKE '%#{params[:query]}%'")
        render json: coupon
      end
        
	end

  
# sorting by coulms 
  private
    def sort_by
       %w(title).include?(params[:sort_by]) ? params[:sort_by] : 'title'
    end
# asd and desd
    def order
       %w(asc desc).include?(params[:order]) ? params[:order] : 'asc'
    end
end
