require 'test_helper'

class EndorsementsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "get endorsement list" do
    get :index
    assert_response :found
  end

  test "get add endorsement form" do
    get :new
    assert_response :found
  end

end
