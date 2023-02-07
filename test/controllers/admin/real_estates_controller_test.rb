require "test_helper"

class Admin::RealEstatesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_real_estates_new_url
    assert_response :success
  end

  test "should get edit" do
    get admin_real_estates_edit_url
    assert_response :success
  end
end
