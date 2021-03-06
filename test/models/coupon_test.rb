require 'test_helper'

class CouponTest < ActiveSupport::TestCase

	test "coupon attributes must not be empty" do
		coupon = Coupon.new
		assert coupon.invalid?
		assert coupon.errors[:title].any?
		assert coupon.errors[:description].any?
		assert coupon.errors[:image_url].any?
		assert coupon.errors[:start_time].any?
		assert coupon.errors[:end_time].any?
	end

end
