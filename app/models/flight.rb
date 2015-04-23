class Flight < ActiveRecord::Base
  # TODO - Make sure the flight is deleted if the corresponding
  # airplane is deleted
  belongs_to :airplane, inverse_of: :flights

  # TODO - Make sure that the review is deleted if the corresponding
  # flight is deleted
  has_one :review, inverse_of: :flight, dependent: :delete

  # TODO - Make sure that the checkride is deleted if the corresponding
  # flight is deleted
  has_one :checkride, inverse_of: :flight, dependent: :delete
end
