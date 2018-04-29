Coupon.transaction do
Coupon.destroy_all


# Products owned by Dave
Coupon.create!(title: 'Buy 1 Taco get 1 Free',
description:
%{
	With purchase of drink
	},
image_url:
open('app/assets/images/tacos.png'),
start_time: DateTime.now,
end_time:DateTime.new(2020, 2 ,3) ,
category: "food",
business_id: Business.find_by_name("Cre8ive Zone").id)

Coupon.create!(title: 'Half off oil change',
description:
%{
	Deal ends soon!
	},
image_url:
open('app/assets/images/oil.jpg'),
start_time: DateTime.now,
end_time:DateTime.new(2020, 2 ,3),
business_id: Business.find_by_name("Cre8ive Zone").id,
category: "automotive")

Coupon.create!(title: 'Save $10 on your next purchase',
description:
%{
	when you spend over $50
	},
image_url:
open('app/assets/images/money.jpg'),
start_time: DateTime.now,
end_time: DateTime.new(2020, 2 ,3) ,
business_id: Business.find_by_name("Cre8ive Zone").id,
category: "other")

Coupon.create!(title: 'Free drink with meal',
description:
%{
	when you come during lunch
	},
image_url:
open('app/assets/images/fastfood.jpg'),
start_time: DateTime.now,
end_time:DateTime.new(2020, 2 ,3) ,
business_id: Business.find_by_name("306 North").id,
category: "food")

Coupon.create!(title: 'Save 5 dollars on next purchase',
description:
%{
	when you spend $40 or more
	},
image_url:
open('app/assets/images/money.jpg'),
start_time: DateTime.now,
end_time:DateTime.new(2020, 2 ,3) ,
business_id: Business.find_by_name("306 North").id,
category: "other")



#306 Norths coupons
Coupon.create!(title: 'Free salad with meal',
description:
%{when you spend over $10},
image_url:
open('app/assets/images/salad.jpg'),
start_time: DateTime.now,
category: "food",
end_time: DateTime.new(2020, 2 ,3) ,
business_id: Business.find_by_name("306 North").id)

Coupon.create!(title: 'Half off burger',
description:
%{After 10pm},
image_url:
open('app/assets/images/ham.jpg'),
start_time: DateTime.now,
category: "food",
end_time: DateTime.new(2020, 2 ,3) ,
business_id: Business.find_by_name("306 North").id)

Coupon.create!(title: '10 percent off your check',
description:
%{just show us your coupon!},
image_url:
open('app/assets/images/resta.jpg'),
start_time: DateTime.now,
category: "food",
end_time: DateTime.new(2020, 2 ,3) ,
business_id: Business.find_by_name("306 North").id)

end

Event.transaction do
Event.destroy_all


# Products owned by Dave
Event.create!(title: 'Cookout at the park!',
description:
%{bring your kids},
image_url:
open('app/assets/images/cookout.jpg'),
start_time: DateTime.new(2018,4,20,4,5,6),
end_time: DateTime.new(2018,5,1,4,5,6),
address: "3320 Bemiss Rd, Valdosta, GA 31605",
business_id: Business.find_by_name("Cre8ive Zone").id)

Event.create!(title: 'Chef special every night this week!',
description:
%{hurry to get yours},
image_url:
open('app/assets/images/resta.jpg'),
address: "3320 Bemiss Rd, Valdosta, GA 31605",
start_time: DateTime.new(2018,4,20,4,5,6),
end_time: DateTime.new(2018,5,1,4,5,6),
business_id: Business.find_by_name("306 North").id)

Event.create!(title: 'Party!',
description:
%{dont forget!},
image_url:
open('app/assets/images/party.jpg'),
address: "3320 Bemiss Rd, Valdosta, GA 31605",
start_time: DateTime.new(2018,4,20,4,5,6),
end_time: DateTime.new(2018,5,1,4,5,6),
business_id: Business.find_by_name("306 North").id)

Event.create!(title: 'Halloween Celebration!',
description:
%{come here on halloween!},
image_url:
open('app/assets/images/halloween.jpg'),
address: "3320 Bemiss Rd, Valdosta, GA 31605",
start_time: DateTime.new(2018,4,20,4,5,6),
end_time: DateTime.new(2018,5,1,4,5,6),
business_id: Business.find_by_name("306 North").id)

Event.create!(title: 'Christmas Celebration!',
description:
%{come here on Christmas!},
image_url:
open('app/assets/images/christ.jpg'),
address: "3320 Bemiss Rd, Valdosta, GA 31605",
start_time: DateTime.new(2018,4,20,4,5,6),
end_time: DateTime.new(2018,5,1,4,5,6),
business_id: Business.find_by_name("306 North").id)


end