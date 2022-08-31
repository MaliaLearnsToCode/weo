require "test_helper"

class CreatorReviewsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get creator_reviews_new_url
    assert_response :success
  end

  test "should get create" do
    get creator_reviews_create_url
    assert_response :success
  end
end
