class Medical < ActiveRecord::Base
  # TODO - Make sure the medical is deleted if the corresponding
  # user is deleted
  belongs_to :user, inverse_of: :medicals



  # Method that returns the user's age at the time of the medical examination
  def age_at_exam
    user_birthday = self.user.birth_date
    self.exam_date.year - user_birthday.year - ((self.exam_date.month > user_birthday.month || (self.exam_date.month == user_birthday.month && self.exam_date.day >= user_birthday.day)) ? 0:1)
  end



  # Given a start date and a number of calendar months from then returns the new date
  def self.calendar_months_from(start_date, number_of_months)
    years_to_add = number_of_months.to_i / 12
    months_to_add = number_of_months.to_i - (12 * years_to_add)

    new_month = months_to_add + start_date.month
    new_year = years_to_add + start_date.year

    if new_month > 12
      new_year += 1
      new_month -= 12
    end

    Date.new(new_year, new_month, -1)
  end



  # Method that returns the expiration date (last valid day) of the medical
  # if it were of the given class
  def end_date(class_to_check)
    age = self.age_at_exam

    if class_to_check == 1 && age < 40
      return Medical.calendar_months_from(self.exam_date, 12)
    elsif class_to_check == 1 && age >= 40
      return Medical.calendar_months_from(self.exam_date, 6)
    elsif class_to_check == 2
      return Medical.calendar_months_from(self.exam_date, 12)
    elsif class_to_check == 3 && age < 40
      return Medical.calendar_months_from(self.exam_date, 60)
    elsif class_to_check == 3 && age >= 40
      return Medical.calendar_months_from(self.exam_date, 24)
    end

    # Issue with medical
    return self.exam_date
  end



  # Returns true if the current medical is still valid for its original privileges
  # and false otherwise
  def original_privileges?
    self.end_date(self.medical_class) >= Date.today
  end



  # Returns true if the medical is still valid for any type of flying (third class
  # privileges) and false if it is not
  def valid_for_flight?
    self.end_date(3) >= Date.today
  end

end
