class CouponSearchController < ApplicationController
  def index
  	@coupons = Coupon.all
  end
end
