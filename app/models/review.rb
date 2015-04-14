class Review < ActiveRecord::Base
  # TODO - Make sure the review is deleted is the corresponding
  # flight is deleted
  belongs_to :flight, inverse_of: :review
end
