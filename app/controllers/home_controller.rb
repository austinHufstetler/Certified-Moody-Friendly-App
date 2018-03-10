class HomeController < ApplicationController
  def index
  	@coupons = Coupon.all
  	@events = Event.all
  end
end
