class Medical < ActiveRecord::Base
  belongs_to :user, inverse_of: :medicals
end
