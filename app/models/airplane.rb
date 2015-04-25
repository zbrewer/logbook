class Airplane < ActiveRecord::Base
  # TODO - Make sure that airplanes are deleted when the corresponding
  # user is deleted
  belongs_to :user, inverse_of: :airplanes

  has_many :flights, inverse_of: :airplane, dependent: :destroy



  # Get the total number of landings for the plane
  def total_landings
    flight_list = self.flights
    landings = 0

    for flight in flight_list do
      landings += flight.day_landings
      landings += flight.night_landings
    end

    return landings
  end



  # Get the total flight time for the plane
  def total_time
    flight_list = self.flights
    time = 0

    for flight in flight_list do
      time += flight.total_time
    end

    return time
  end



  # Get the number of flights for the airplane
  def number_of_flights
    self.flights.size
  end

end
