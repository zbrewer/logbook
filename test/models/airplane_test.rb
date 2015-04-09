require 'test_helper'

class AirplaneTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "test arrow" do
    airplane = airplanes(:test_arrow)
    assert_equal "N5493Z", airplane.identification
    assert_equal "PA-28R-201", airplane.airplane_type
    assert airplane.complex
    assert_not airplane.high_performance
    assert_not airplane.tailwheel
    assert_not airplane.high_altitude
    assert_not airplane.turbine
    assert_not airplane.glider
    assert_not airplane.rotorcraft
    assert_not airplane.powered_lift
    assert_not airplane.lighter_than_air
    assert airplane.single_engine_land
    assert_not airplane.single_engine_sea
    assert_not airplane.multi_engine_land
    assert_not airplane.multi_engine_sea
    assert_not airplane.simulator
    assert_equal "Test Arrow", airplane.display_name
    assert_not airplane.user.nil?
    assert_equal 12345, airplane.user.certificate_number
  end

  test "test defaults" do
    airplane = airplanes(:test_defaults)
    assert_equal "N157ME", airplane.identification
    assert_equal "C172SP", airplane.airplane_type
    assert_not airplane.complex
    assert_not airplane.high_performance
    assert_not airplane.tailwheel
    assert_not airplane.high_altitude
    assert_not airplane.turbine
    assert_not airplane.glider
    assert_not airplane.rotorcraft
    assert_not airplane.powered_lift
    assert_not airplane.lighter_than_air
    assert_not airplane.single_engine_land
    assert_not airplane.single_engine_sea
    assert_not airplane.multi_engine_land
    assert_not airplane.multi_engine_sea
    assert_not airplane.simulator
    assert_equal "Test Defaults Airplane", airplane.display_name
    assert_not airplane.user.nil?
    assert_equal 54321, airplane.user.certificate_number
  end

end
