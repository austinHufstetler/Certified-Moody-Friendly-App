# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# . . .


Business.transaction do
Business.delete_all
Business.create!( :name => 'Cr8ive Zone', :address => "3320 Bemiss Rd, Valdosta, GA 31605",  logo_url: open('app/assets/images/cr8ivezone.png'))
Business.create!( :name => 'Ray Norton Tire & Auto Center', :address => "2606 Bemiss Rd, Valdosta, GA 31602",  logo_url: open('app/assets/images/raynorton.png'))
Business.create!( :name => '1st America Home Medical Equipment', :address => "212 Northside Dr, Valdosta, GA 31602",  logo_url: open('app/assets/images/1stamericanhome.png'))
Business.create!( :name => '1st Franklin Financial Corporation', :address => "1900 Gornto Rd Suite G, Valdosta, GA 31602",  logo_url: open('app/assets/images/1stfranklin.png'))
Business.create!( :name => '306 North', :address => "306 N Patterson St, Valdosta, GA 31601",  logo_url: open('app/assets/images/306north.jpeg'))
end

Account.transaction do
Account.delete_all
Account.create!( :email => 'business1@email.com', :password => 'changeme', :password_confirmation => 'changeme',:accountable => Business.find_by_name("Cr8ive Zone"))
Account.create!( :email => 'business2@email.com', :password => 'changeme', :password_confirmation => 'changeme',:accountable => Business.find_by_name("Ray Norton Tire & Auto Center"))
Account.create!( :email => 'business3@email.com', :password => 'changeme', :password_confirmation => 'changeme',:accountable => Business.find_by_name("1st America Home Medical Equipment"))
Account.create!( :email => 'business4@email.com', :password => 'changeme', :password_confirmation => 'changeme',:accountable => Business.find_by_name("1st Franklin Financial Corporation"))
Account.create!( :email => 'business5@email.com', :password => 'changeme', :password_confirmation => 'changeme',:accountable => Business.find_by_name("306 North"))
end

Coupon.transaction do
Coupon.delete_all


# Products owned by Dave
Coupon.create!(title: 'Buy 1 Taco get 1 Free',
description:
%{
	With purchase of drink
	},
image_url:
open('app/assets/images/tacos.png'),
start_time: DateTime.now,
end_time:DateTime.now ,
business_id: Business.find_by_name("Cr8ive Zone").id)

Coupon.create!(title: 'Half off oil change',
description:
%{
	Deal ends soon!
	},
image_url:
open('app/assets/images/oil.jpg'),
start_time: DateTime.now,
end_time:DateTime.now ,
business_id: Business.find_by_name("Cr8ive Zone").id)

Coupon.create!(title: 'Save $10 on your next purchase',
description:
%{
	when you spend over $50
	},
image_url:
open('app/assets/images/money.jpg'),
start_time: DateTime.now,
end_time:DateTime.now ,
business_id: Business.find_by_name("Cr8ive Zone").id)

Coupon.create!(title: 'Free drink with meal',
description:
%{
	when you come during lunch
	},
image_url:
open('app/assets/images/fastfood.jpg'),
start_time: DateTime.now,
end_time:DateTime.now ,
business_id: Business.find_by_name("306 North").id)

Coupon.create!(title: 'Save 5 dollars on next purchase',
description:
%{
	when you spend $40 or more
	},
image_url:
open('app/assets/images/money.jpg'),
start_time: DateTime.now,
end_time:DateTime.now ,
business_id: Business.find_by_name("306 North").id)

end

Event.transaction do
Event.delete_all


# Products owned by Dave
Event.create!(title: 'Cookout at the park!',
description:
%{
	bring your kids
	},
image_url:
open('app/assets/images/cookout.jpg'),
start_time: DateTime.now,
end_time:DateTime.now ,
address: "3320 Bemiss Rd, Valdosta, GA 31605",
business_id: Business.find_by_name("Cr8ive Zone").id)

Event.create!(title: 'Huge sale event at home depot!',
description:
%{
	its going fast!
	},
image_url:
open('app/assets/images/homedepot.jpg'),
address: "3320 Bemiss Rd, Valdosta, GA 31605",
start_time: DateTime.now,
end_time:DateTime.now ,
business_id: Business.find_by_name("306 North").id)

end