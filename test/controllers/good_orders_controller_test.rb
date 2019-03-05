require 'test_helper'

class GoodOrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get good_orders_new_url
    assert_response :success
  end

  test "should get index" do
    get good_orders_index_url
    assert_response :success
  end

  test "should get show" do
    get good_orders_show_url
    assert_response :success
  end

end
