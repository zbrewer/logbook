require 'test_helper'

class AirplanesControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "get airplane list" do
    get :index
    assert_response :found
  end

  test "get add airplane form" do
    get :new
    assert_response :found
  end

  test "get first airplane page" do
    get(:show, {'id' => "1"})
    assert_response :found
  end

end
