class HomeController < ApplicationController
  def index
  	
  	coupons_all = Coupon.where("start_time <= ? and end_time >= ?", Time.now, Time.now )
  	@coupons = []
  	coupons_all.each do |c|
  		if(c.business.account.approved == true)
  			@coupons << c
  		end
  	end

  	#coupons sorted by popularity
  	@coupons = @coupons.sort_by{|c| c.get_likes.size }
  	#"hottest" first and get top 15
  	@coupons = @coupons.reverse.first(15)
  	#get 15 most upcoming events sorted by recency

 	events_all = Event.where("start_time <= ? and end_time >= ?", Time.now, Time.now )
  	@upcoming_events = []
  	events_all.each do |e|
  		if(e.business.account.approved == true)
  			@upcoming_events << e
  		end
  	end

  	@upcoming_events = @upcoming_events.sort_by{|e| e.start_time}.first(15)
  end
end
