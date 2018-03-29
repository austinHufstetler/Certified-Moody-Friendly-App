require 'test_helper'

class FavoriteEventsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get favorite_events_index_url
    assert_response :success
  end

end
