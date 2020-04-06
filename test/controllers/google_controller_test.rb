require 'test_helper'

class GoogleControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get google_index_url
    assert_response :success
  end

end
