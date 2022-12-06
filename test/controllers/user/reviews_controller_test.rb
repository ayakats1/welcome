require "test_helper"

class User::ReviewsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get user_reviews_new_url
    assert_response :success
  end

  test "should get create" do
    get user_reviews_create_url
    assert_response :success
  end

  test "should get destroy" do
    get user_reviews_destroy_url
    assert_response :success
  end
end
