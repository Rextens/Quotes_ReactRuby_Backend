require "test_helper"

class QuotesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get quotes_index_url
    assert_response :success
  end

  test "should get create" do
    get quotes_create_url
    assert_response :success
  end

  test "should get udpate" do
    get quotes_udpate_url
    assert_response :success
  end

  test "should get destroy" do
    get quotes_destroy_url
    assert_response :success
  end
end
