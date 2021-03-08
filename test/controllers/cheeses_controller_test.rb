require "test_helper"

class CheesesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cheese = cheeses(:one)
  end

  test "should get index" do
    get cheeses_url, as: :json
    assert_response :success
  end

  test "should create cheese" do
    assert_difference('Cheese.count') do
      post cheeses_url, params: { cheese: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show cheese" do
    get cheese_url(@cheese), as: :json
    assert_response :success
  end

  test "should update cheese" do
    patch cheese_url(@cheese), params: { cheese: {  } }, as: :json
    assert_response 200
  end

  test "should destroy cheese" do
    assert_difference('Cheese.count', -1) do
      delete cheese_url(@cheese), as: :json
    end

    assert_response 204
  end
end
