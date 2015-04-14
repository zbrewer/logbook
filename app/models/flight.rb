class Flight < ActiveRecord::Base
  # TODO - Make sure the flight is deleted if the corresponding
  # airplane is deleted
  belongs_to :airplane, inverse_of: :flights
end
