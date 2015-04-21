require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "john doe" do
    user = users(:john_doe)
    assert_equal "test@example.com", user.email
    assert_equal "test hash", user.encrypted_password
    assert_equal "John", user.first_name
    assert_equal "Doe", user.last_name
    assert_equal Date.new(1990, 8, 12), user.birth_date
    assert_equal 12345, user.certificate_number
    assert_equal "PPL", user.certificate_type
    assert_equal Date.new(2014, 8, 12), user.certificate_issue_date
    assert_not user.medicals.empty?
    assert_equal 1, user.medicals[0].medical_class
    assert_not user.airplanes.empty?
    assert_equal "N5493Z", user.airplanes[0].identification
    assert_not user.endorsements.empty?
    assert user.endorsements[0].complex
    assert_equal 100, user.endorsements[0].cfi_certificate_number
    assert_not user.airplanes[0].flights.empty?
    assert_equal "Local IFR training flight", user.airplanes[0].flights[0].remarks
    assert_not user.flights.empty?
    assert_equal "Local IFR training flight", user.flights[0].remarks
    assert_not user.reviews.empty?
    assert user.reviews[0].flight_review
    assert_not user.reviews[0].cfi_renewal
    assert_equal "Harry Potter", user.reviews[0].name_of_reviewer
    assert user.checkrides.empty?
    assert_equal 21, user.current_medical.age_at_exam
    assert_equal Date.new(2014, 6, 10), user.oldest_day_currency_flight
    assert_equal Date.new(2014, 6, 10), user.oldest_night_currency_flight
    assert_equal Date.new(2014, 9, 8), user.last_day_current_date
    assert_equal Date.new(2014, 9, 8), user.last_night_current_date
  end

  test "jane doe" do
    user = users(:jane_doe)
    assert_equal "test_two@example.com", user.email
    assert_equal "another test hash", user.encrypted_password
    assert_equal "Jane", user.first_name
    assert_equal "Doe", user.last_name
    assert_equal Date.new(1992, 10, 3), user.birth_date
    assert_equal 54321, user.certificate_number
    assert_equal "STU", user.certificate_type
    assert_equal Date.new(2015, 3, 7), user.certificate_issue_date
    assert_not user.medicals.empty?
    assert_equal 3, user.medicals[0].medical_class
    assert_not user.airplanes.empty?
    assert_equal "N157ME", user.airplanes[0].identification
    assert_not user.endorsements.empty?
    assert_not user.endorsements[0].complex
    assert_equal 101, user.endorsements[0].cfi_certificate_number
    assert_not user.airplanes[0].flights.empty?
    assert_equal "Solo XC", user.airplanes[0].flights[0].remarks
    assert_not user.flights.empty?
    assert_equal "Solo XC", user.flights[0].remarks
    assert user.reviews.empty?
    assert_not user.checkrides.empty?
    assert_equal "John Oliver", user.checkrides[0].examiner_name
    assert_equal 21, user.current_medical.age_at_exam
    assert_equal nil, user.oldest_day_currency_flight
    assert_equal nil, user.oldest_night_currency_flight
    assert_equal nil, user.last_day_current_date
    assert_equal nil, user.last_night_current_date
  end

end
