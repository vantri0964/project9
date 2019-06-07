require 'test_helper'

class SugestsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sugests_index_url
    assert_response :success
  end

end
