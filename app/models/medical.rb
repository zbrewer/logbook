class Medical < ActiveRecord::Base
  # TODO - Make sure the medical is deleted if the corresponding
  # user is deleted
  belongs_to :user, inverse_of: :medicals
end
