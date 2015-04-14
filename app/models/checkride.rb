class Checkride < ActiveRecord::Base
  # TODO - Make sure that the checkride is deleted when the associated
  # flight is deleted
  belongs_to :flight, inverse_of: :checkride
end
