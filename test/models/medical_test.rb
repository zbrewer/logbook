require 'test_helper'

class MedicalTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "first class medical" do
    medical = medicals(:first_class)
    assert_equal Date.new(2012, 7, 15), medical.exam_date
    assert_equal 1, medical.medical_class
    assert_equal "George Washington", medical.examiner_name
  end

  test "third class medical" do
    medical = medicals(:third_class)
    assert_equal Date.new(2013, 2, 21), medical.exam_date
    assert_equal 3, medical.medical_class
    assert_equal "Thomas Jefferson", medical.examiner_name
  end

end
