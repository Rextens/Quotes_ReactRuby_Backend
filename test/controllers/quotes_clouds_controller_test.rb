require "test_helper"

class QuotesCloudsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @quotes_cloud = quotes_clouds(:one)
  end

  test "should get index" do
    get quotes_clouds_url, as: :json
    assert_response :success
  end

  test "should create quotes_cloud" do
    assert_difference('QuotesCloud.count') do
      post quotes_clouds_url, params: { quotes_cloud: { address: @quotes_cloud.address, email: @quotes_cloud.email, name: @quotes_cloud.name, phone: @quotes_cloud.phone } }, as: :json
    end

    assert_response 201
  end

  test "should show quotes_cloud" do
    get quotes_cloud_url(@quotes_cloud), as: :json
    assert_response :success
  end

  test "should update quotes_cloud" do
    patch quotes_cloud_url(@quotes_cloud), params: { quotes_cloud: { address: @quotes_cloud.address, email: @quotes_cloud.email, name: @quotes_cloud.name, phone: @quotes_cloud.phone } }, as: :json
    assert_response 200
  end

  test "should destroy quotes_cloud" do
    assert_difference('QuotesCloud.count', -1) do
      delete quotes_cloud_url(@quotes_cloud), as: :json
    end

    assert_response 204
  end
end
