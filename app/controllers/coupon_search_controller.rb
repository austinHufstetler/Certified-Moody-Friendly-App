class CouponSearchController < ApplicationController
  def index
  	@coupons = Coupon.all

    
    respond_to do |format|
      format.html {
          render 'index'
      }
      format.json {render json: Coupon.order(sort_by + ' ' + order)}
    end

  end


  def search
    	coupons = Coupon.where("title LIKE '%#{params[:query]}%'")
    	render json: coupons
	end

  private
    def sort_by
       %w(title).include?(params[:sort_by]) ? params[:sort_by] : 'title'
    end
    def order
       %w(asc desc).include?(params[:order]) ? params[:order] : 'asc'
    end
end
