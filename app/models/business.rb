class Business < ApplicationRecord
	has_one :account, as: :accountable
	has_many :coupons
	has_many :events
end
