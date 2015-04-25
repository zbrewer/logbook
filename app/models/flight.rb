class Flight < ActiveRecord::Base
  belongs_to :airplane, inverse_of: :flights

  has_one :review, inverse_of: :flight, dependent: :delete

  has_one :checkride, inverse_of: :flight, dependent: :delete



  # Gets an array of destination airports. The string of
  # destination airports should be separated by spaces
  def get_destination_airports
    self.destination_airports.delete(',').split(' ').uniq
  end



  # Gets an array of all airports on a flight
  def get_airports
    self.get_destination_airports.push(self.departure_airport).uniq
  end

end
