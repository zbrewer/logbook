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
  end

end
