class Airplane < ActiveRecord::Base
  # TODO - Make sure that airplanes are deleted when the corresponding
  # user is deleted
  belongs_to :user, inverse_of: :airplanes

  has_many :flights, inverse_of: :airplane, dependent: :destroy
end
