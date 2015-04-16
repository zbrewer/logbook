require 'test_helper'

class ReviewsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "get add review form" do
    get(:new, {'flight_id' => "1"})
    assert_response :found
  end

end
