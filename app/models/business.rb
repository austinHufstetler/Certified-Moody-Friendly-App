class Business < ApplicationRecord
	mount_uploader :logo_url, PictureUploader
	validates :name, :address, :logo_url, presence: true
	validates :logo_url, allow_blank: true, format: {
		with:
		%r{\.(gif|jpg|png)\Z}i,
		message: 'must be a URL for GIF, JPG or PNG image.'
	}
	has_one :account, as: :accountable
	has_many :coupons,dependent: :destroy
	has_many :events,dependent: :destroy
end
