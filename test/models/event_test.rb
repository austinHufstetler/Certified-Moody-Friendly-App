require 'test_helper'

class EventTest < ActiveSupport::TestCase

	test "event attributes must not be empty" do
		event = Event.new
		assert event.invalid?
		assert event.errors[:title].any?
		assert event.errors[:description].any?
		assert event.errors[:image_url].any?
		assert event.errors[:start_date].any?
		assert event.errors[:end_date].any?
	end

end
