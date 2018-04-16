Business.transaction do
Business.delete_all
Business.create( :name => 'Cr8ive Zone', :address => "3320 Bemiss Rd, Valdosta, GA 31605")
end

Account.transaction do
Account.delete_all
Account.create( :email => 'business1@email.com', :password => 'changeme', :password_confirmation => 'changeme',:accountable => Business.find_by_name("Cr8ive Zone"))
end

Coupon.transaction do
Coupon.delete_all


# Products owned by Dave
Product.create!(title: 'Agile Web Development with Rails 4',
description:
%{<p>
Rails just keeps on changing. Both Rails 3 and 4, as well as Ruby 1.9 and 2.0
,
bring hundreds of improvements, including new APIs and substantial performanc
e
enhancements. The fourth edition of this award-winning classic has been reorg
anized
and refocused so it's more useful than ever before for developers new to Ruby
and Rails.
</p>},
image_url:
open('app/assets/images/tacos.png'),
business_id: Business.find_by_name("Cr8ive Zone").id)

end

Event.transaction do
Event.delete_all


# Products owned by Dave
Event.create!(title: 'Agile Web Development with Rails 4',
description:
%{<p>
Rails just keeps on changing. Both Rails 3 and 4, as well as Ruby 1.9 and 2.0
,
bring hundreds of improvements, including new APIs and substantial performanc
e
enhancements. The fourth edition of this award-winning classic has been reorg
anized
and refocused so it's more useful than ever before for developers new to Ruby
and Rails.
</p>},
image_url:
open('app/assets/images/tacos.png'),
business_id: Business.find_by_name("Cr8ive Zone").id)

end