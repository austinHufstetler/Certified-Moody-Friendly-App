class CouponSearchController < ApplicationController
  def index
  	@coupons = Coupon.all

    respond_to do |format|
      format.html {
          render 'index'
      }
      format.json {render json: @coupons}
    end

  end


  def search
    	coupons = Coupon.where("title LIKE '%#{params[:query]}%'")
    	render json: coupons
	end
end
