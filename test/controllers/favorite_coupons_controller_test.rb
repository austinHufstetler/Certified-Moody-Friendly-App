require 'test_helper'

class FavoriteCouponsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get favorite_coupons_index_url
    assert_response :success
  end

end
