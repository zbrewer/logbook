require 'test_helper'

class EndorsementTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "complex endorsement" do
    endorsement = endorsements(:test_complex_endorsement)
    assert_equal Date.new(2014, 12, 1), endorsement.endorsement_date
    assert_equal "Stephen Colbert", endorsement.cfi_name
    assert_equal 100, endorsement.cfi_certificate_number
    assert_equal Date.new(2016, 12, 1), endorsement.cfi_expiration_date
    assert endorsement.complex
    assert_not endorsement.high_performance
    assert_not endorsement.tailwheel
    assert_not endorsement.high_altitude
  end

  test "endorsement defaults" do
    endorsement = endorsements(:endorsement_defaults)
    assert_equal Date.new(2015, 4, 8), endorsement.endorsement_date
    assert_equal "Steve Carell", endorsement.cfi_name
    assert_equal 101, endorsement.cfi_certificate_number
    assert_equal Date.new(2015, 4, 8), endorsement.cfi_expiration_date
    assert_not endorsement.complex
    assert_not endorsement.high_performance
    assert_not endorsement.tailwheel
    assert_not endorsement.high_altitude
  end

end
