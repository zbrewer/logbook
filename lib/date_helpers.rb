# Date helpers that can be used in all of the models.
module DateHelpers

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

end
