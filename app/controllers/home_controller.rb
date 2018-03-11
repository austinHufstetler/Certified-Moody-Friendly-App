class HomeController < ApplicationController
  def index
  	@coupons = Coupon.all
  	@upcoming_events = Event.order(:start_date)
  end
end
