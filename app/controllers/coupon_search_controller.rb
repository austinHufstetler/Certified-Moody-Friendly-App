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


 #method to find all coupons with the business id.
 def search
      if Business.where("name LIKE '%#{params[:query]}%'").pluck(:id).present?
        business = Business.where("name LIKE '%#{params[:query]}%'").pluck(:id)
        coupons = Coupon.where(business_id: business)
        render json: coupons
      else
        coupon = Coupon.where("title LIKE '%#{params[:query]}%'")
        render json: coupon
      end
        
	end

  #method that find coupons 
 # def couponSearch
     # coupon = Coupon.where("title LIKE '%#{params[:query]}%'")
     # render json: coupon
 # end 

  private
    def sort_by
       %w(title).include?(params[:sort_by]) ? params[:sort_by] : 'title'
    end

    def order
       %w(asc desc).include?(params[:order]) ? params[:order] : 'asc'
    end
end
