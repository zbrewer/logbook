class Review < ActiveRecord::Base
  belongs_to :flight, inverse_of: :review
end
