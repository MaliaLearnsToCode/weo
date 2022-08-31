require "test_helper"

class ParticipantReviewsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get participant_reviews_new_url
    assert_response :success
  end

  test "should get create" do
    get participant_reviews_create_url
    assert_response :success
  end
end
