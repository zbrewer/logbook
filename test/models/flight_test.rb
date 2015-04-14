require 'test_helper'

class FlightTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "instrument training flight" do
    flight = flights(:instrument_training)
    assert_equal Date.new(2014, 6, 10), flight.flight_date
    assert_in_delta 1.3, flight.total_time, 0.0000000001
    assert_in_delta 1.3, flight.pic_time, 0.0000000001
    assert_in_delta 0, flight.sic_time, 0.0000000001
    assert_in_delta 1.3, flight.dual_received, 0.0000000001
    assert_in_delta 0, flight.dual_given, 0.0000000001
    assert_equal 0, flight.day_landings
    assert_equal 3, flight.night_landings
    assert_in_delta 0.4, flight.actual_instrument, 0.0000000001
    assert_in_delta 0.6, flight.simulated_instrument, 0.0000000001
    assert_equal 3, flight.number_approaches
    assert_equal 1, flight.number_holds
    assert_equal "Local IFR training flight", flight.remarks
    assert_equal "KCMI", flight.departure_airport
    assert_equal "KCMI", flight.destination_airports
    assert_in_delta 1.3, flight.night_time, 0.0000000001
    assert_in_delta 0, flight.cross_country_time, 0.0000000001
    assert_in_delta 0, flight.solo_time, 0.0000000001
    assert_not flight.airplane.nil?
    assert_equal "N5493Z", flight.airplane.identification
    assert_not flight.review.nil?
    assert flight.review.flight_review
    assert_not flight.review.instrument_proficiency_check
  end

  test "cross country flight" do
    flight = flights(:cross_country)
    assert_equal Date.new(2015, 2, 4), flight.flight_date
    assert_in_delta 3.4, flight.total_time, 0.0000000001
    assert_in_delta 3.4, flight.pic_time, 0.0000000001
    assert_in_delta 0, flight.sic_time, 0.0000000001
    assert_in_delta 0, flight.dual_received, 0.0000000001
    assert_in_delta 0, flight.dual_given, 0.0000000001
    assert_equal 2, flight.day_landings
    assert_equal 0, flight.night_landings
    assert_in_delta 0.1, flight.actual_instrument, 0.0000000001
    assert_in_delta 0, flight.simulated_instrument, 0.0000000001
    assert_equal 0, flight.number_approaches
    assert_equal 0, flight.number_holds
    assert_equal "Solo XC", flight.remarks
    assert_equal "KCMI", flight.departure_airport
    assert_equal "KSDF KCMI", flight.destination_airports
    assert_in_delta 0, flight.night_time, 0.0000000001
    assert_in_delta 3.4, flight.cross_country_time, 0.0000000001
    assert_in_delta 3.4, flight.solo_time, 0.0000000001
    assert_not flight.airplane.nil?
    assert_equal "N157ME", flight.airplane.identification
    assert flight.review.nil?
  end

end
