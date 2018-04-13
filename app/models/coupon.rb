class Coupon < ApplicationRecord
	mount_uploader :image_url, PictureUploader
	validates :title, :description, :image_url, :start_time, :end_time, presence: true
	validates :image_url, allow_blank: true, format: {
		with:
		%r{\.(gif|jpg|png)\Z}i,
		message: 'must be a URL for GIF, JPG or PNG image.'
	}
	belongs_to :business
	acts_as_votable
	has_many :reports, as: :reportable, dependent: :destroy
end
