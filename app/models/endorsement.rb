class Endorsement < ActiveRecord::Base
  # TODO - Make sure the endorsement is deleted when the corresponding
  # user is deleted
  belongs_to :user, inverse_of: :endorsements
end
