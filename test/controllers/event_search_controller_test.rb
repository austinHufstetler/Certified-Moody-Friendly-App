require 'test_helper'

class EventSearchControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get event_search_index_url
    assert_response :success
  end

end
