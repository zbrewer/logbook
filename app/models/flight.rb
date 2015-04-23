class Flight < ActiveRecord::Base
  belongs_to :airplane, inverse_of: :flights

  has_one :review, inverse_of: :flight, dependent: :delete

  has_one :checkride, inverse_of: :flight, dependent: :delete
end
