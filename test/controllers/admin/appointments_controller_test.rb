require "test_helper"

class Admin::AppointmentsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_appointments_new_url
    assert_response :success
  end

  test "should get index" do
    get admin_appointments_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_appointments_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_appointments_edit_url
    assert_response :success
  end
end
