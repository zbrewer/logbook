class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  # TODO - Make sure medicals are deleted if the corresponding
  # user is deleted
  has_many :medicals, inverse_of: :user

  # TODO - Make sure airplanes are deleted when the corresponding
  # user is deleted
  has_many :airplanes, inverse_of: :user

  # TODO - Make sure endorsements are deleted when the corresponding
  # user is deleted
  has_many :endorsements, inverse_of: :user
end
