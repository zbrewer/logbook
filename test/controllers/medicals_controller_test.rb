require 'test_helper'

class MedicalsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "get medical list" do
    get :index
    assert_response :found
  end

  test "get add medical form" do
    get :new
    assert_response :found
  end

end
