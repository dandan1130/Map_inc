require 'test_helper'

class MapsControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get maps_home_url
    assert_response :success
  end

  test "should get about" do
    get maps_about_url
    assert_response :success
  end

end
