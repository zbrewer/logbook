class Checkride < ActiveRecord::Base
  belongs_to :flight, inverse_of: :checkride
end
