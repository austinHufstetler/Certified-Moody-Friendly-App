class Business < ApplicationRecord
	mount_uploader :logo_url, PictureUploader
	has_one :account, as: :accountable
	has_many :coupons,dependent: :destroy
	has_many :events,dependent: :destroy
	has_many :reports, as: :reportable, dependent: :destroy
end
