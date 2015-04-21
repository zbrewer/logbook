require 'test_helper'

class MedicalTest < ActiveSupport::TestCase

  include DateHelpers

  test "first class medical" do
    medical = medicals(:first_class)
    assert_equal Date.new(2012, 7, 15), medical.exam_date
    assert_equal 1, medical.medical_class
    assert_equal "George Washington", medical.examiner_name
    assert_not medical.user.nil?
    assert_equal 12345, medical.user.certificate_number
    assert_equal "John", medical.user.first_name
    assert_equal 21, medical.age_at_exam
    assert_equal Date.new(2015, 6, 30), DateHelpers.calendar_months_from(Date.new(2013, 10, 12), 20)
    assert_equal Date.new(2017, 07, 31), medical.end_date(3)
    assert_equal Date.new(2013, 07, 31), medical.end_date(1)
    assert_not medical.original_privileges?
  end

  test "third class medical" do
    medical = medicals(:third_class)
    assert_equal Date.new(2013, 10, 3), medical.exam_date
    assert_equal 3, medical.medical_class
    assert_equal "Thomas Jefferson", medical.examiner_name
    assert_not medical.user.nil?
    assert_equal 54321, medical.user.certificate_number
    assert_equal "Jane", medical.user.first_name
    assert_equal 21, medical.age_at_exam
    assert_equal Date.new(2015, 4, 30), DateHelpers.calendar_months_from(Date.new(2015, 4, 1), 0)
    assert_equal Date.new(2018, 10, 31), medical.end_date(3)
  end

end
