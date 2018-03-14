require 'test_helper'

class CouponSearchControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get coupon_search_index_url
    assert_response :success
  end

end
