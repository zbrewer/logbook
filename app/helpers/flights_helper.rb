module FlightsHelper

  # Takes the remarks for a flight. Returns the remarks unchanged if
  # there are 50 characters or fewer. If the remarks are longer than
  # 50 characters then it returns the first 47 characters with "..."
  # appended. This ensures that the remarks displayed with this
  # function are always 50 characters long or less.
  def display_remarks(remarks)
    if remarks.length <= 50
      remarks
    else
      remarks[0..46] + "..."
    end
  end
end
