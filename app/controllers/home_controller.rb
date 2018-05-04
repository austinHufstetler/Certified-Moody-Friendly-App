class HomeController < ApplicationController
  def index
  	
  	coupons_all = Coupon.where("start_time <= ? and end_time >= ?", Time.now, Time.now )
  	@coupons = []
  	coupons_all.each do |c|
  		if(c.business.account.approved == true)
        if(Report.where(:reportable_id => c.id, :reportable_type => "Coupon").blank?)
  			   @coupons << c
        end
  		end
  	end

  	#coupons sorted by popularity
  	@coupons = @coupons.sort_by{|c| c.get_likes.size }
  	#"hottest" first and get top 15
  	@coupons = @coupons.reverse.first(15)
  	#get 15 most upcoming events sorted by recency

 	events_all = Event.where("end_time >= ?", Time.now )
  	@upcoming_events = []
  	events_all.each do |e|
  		if(e.business.account.approved == true)
        if(Report.where(:reportable_id => e.id, :reportable_type => "Event").blank?)
  			   @upcoming_events << e
        end
  		end
  	end

  	@upcoming_events = @upcoming_events.sort_by{|e| e.start_time}.first(15)
  end
end
