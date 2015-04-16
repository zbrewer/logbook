require 'test_helper'

class CheckridesControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "get add checkride form" do
    get(:new, {'flight_id' => "1"})
    assert_response :found
  end

end
