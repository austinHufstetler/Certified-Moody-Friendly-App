class CouponSearchController < ApplicationController
  def index
      coupons_all = Coupon.joins(:business).select("Coupons.id, image_url, name, title, Coupons.description, category, business_id").where("start_time <= ? and end_time >= ? and business_id = Businesses.id", Time.now, Time.now).order(sort_by + ' ' + order)
      @coupons = []
      coupons_all.each do |c|
        if(c.business.account.approved == true)
          if(Report.where(:reportable_id => c.id, :reportable_type => "Coupon").blank?)
            @coupons << c
          end
        end
      end
    @business= Business.all 
    respond_to do |format|
      format.html {
          render 'index'
      }
      format.json {render json: @coupons}
    end

  end
 
 def search
  #method to find all coupons with the business id. it is going to be skipped to the coupon method that finds it by title 
      if Business.where("upper(name) LIKE upper('%#{params[:query]}%')").pluck(:id).present?
        business = Business.where("upper(name) LIKE upper('%#{params[:query]}%')").pluck(:id)
        coupons = Coupon.joins(:business).select("Coupons.id, image_url, name, title, Coupons.description, category, business_id").where(business_id: business).where("start_time <= ? and end_time >= ?", Time.now, Time.now)
        @coupons = []
        coupons.each do |c|
          if(c.business.account.approved == true)
            if(Report.where(:reportable_id => c.id, :reportable_type => "Coupon").blank?)
              @coupons << c
            end
          end
        end
        render json: @coupons
      else
        #method that find coupons 
        coupon = Coupon.joins(:business).select("Coupons.id, image_url, name, title, Coupons.description, category, business_id").where("upper(title) LIKE upper('%#{params[:query]}%') or upper(category) LIKE upper('%#{params[:query]}%')").where("start_time <= ? and end_time >= ?", Time.now, Time.now)
        @coupons = []
        coupon.each do |c|
          if(c.business.account.approved == true)
            if(Report.where(:reportable_id => c.id, :reportable_type => "Coupon").blank?)
              @coupons << c
            end
          end
        end
        render json: @coupons
      end
        
	end

  
# sorting by coulms 
  private
    def sort_by
       %w(title).include?(params[:sort_by]) ? params[:sort_by] : 'title'
    end
# asc and desc
    def order
       %w(asc desc).include?(params[:order]) ? params[:order] : 'asc'
    end
end
