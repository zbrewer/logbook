require 'test_helper'

class CheckrideTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "PPL checkride" do
    checkride = checkrides(:ppl_checkride)
    assert_equal Date.new(2014, 5, 8), checkride.checkride_date
    assert_equal "John Oliver", checkride.examiner_name
    assert_not checkride.cfi
    assert_not checkride.cfii
    assert_not checkride.instrument
    assert checkride.certificate
    assert_equal "PPL", checkride.certificate_type
    assert checkride.single_engine_land
    assert_not checkride.single_engine_sea
    assert_not checkride.multi_engine_land
    assert_not checkride.multi_engine_sea
    assert_not checkride.rotorcraft
    assert_not checkride.glider
    assert_not checkride.powered_lift
    assert_not checkride.lighter_than_air
  end

  test "instrument checkride with defaults" do
    checkride = checkrides(:instrument_with_defaults)
    assert_equal Date.new(2015, 4, 8), checkride.checkride_date
    assert_equal "John Stewart", checkride.examiner_name
    assert_not checkride.cfi
    assert_not checkride.cfii
    assert checkride.instrument
    assert_not checkride.certificate
    assert_not checkride.single_engine_land
    assert_not checkride.single_engine_sea
    assert_not checkride.multi_engine_land
    assert_not checkride.multi_engine_sea
    assert_not checkride.rotorcraft
    assert_not checkride.glider
    assert_not checkride.powered_lift
    assert_not checkride.lighter_than_air
  end

end
