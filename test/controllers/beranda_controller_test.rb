require 'test_helper'

class BerandaControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get beranda_index_url
    assert_response :success
  end

end
