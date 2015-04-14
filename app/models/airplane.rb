class Airplane < ActiveRecord::Base
  # TODO - Make sure that airplanes are deleted when the corresponding
  # user is deleted
  belongs_to :user, inverse_of: :airplanes

  # TODO - make sure that flights are deleted when the corresponding
  # airplane is deleted
  has_many :flights, inverse_of: :airplane
end
