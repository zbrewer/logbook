require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "flight review" do
    review = reviews(:test_flight_review)
    assert_equal Date.new(2015, 4, 8), review.review_date
    assert_equal "Harry Potter", review.name_of_reviewer
    assert review.flight_review
    assert_not review.instrument_proficiency_check
    assert_not review.cfi_renewal
    assert_not review.flight.nil?
    assert_equal "Local IFR training flight", review.flight.remarks
  end

  test "review defaults" do
    review = reviews(:review_defaults)
    assert_equal Date.new(2015, 4, 8), review.review_date
    assert_equal "Hagrid", review.name_of_reviewer
    assert_not review.flight_review
    assert_not review.instrument_proficiency_check
    assert_not review.cfi_renewal
    assert review.flight.nil?
  end

end
