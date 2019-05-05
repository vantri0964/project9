require 'test_helper'

class Admin::SharesControllerTest < ActionDispatch::IntegrationTest
  test "should get _menu" do
    get admin_shares__menu_url
    assert_response :success
  end

end
