require 'test_helper'

class FlightsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "get flight list" do
    get :index
    assert_response :found
  end

  test "get add flight form" do
    get :new
    assert_response :found
  end

  test "get first flight page" do
    get(:show, {'id' => "1"})
    assert_response :found
  end

end
