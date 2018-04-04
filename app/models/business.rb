class Business < ApplicationRecord
	mount_uploader :logo_url, PictureUploader
	has_one :account, as: :accountable
	geocoded_by :address
  	after_validation :geocode
	has_many :coupons,dependent: :destroy
	has_many :events,dependent: :destroy
	
end
