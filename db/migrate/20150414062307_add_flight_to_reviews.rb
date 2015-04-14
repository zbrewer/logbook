class AddFlightToReviews < ActiveRecord::Migration
  def change
    add_reference :reviews, :flight, index: true
    add_foreign_key :reviews, :flights
  end
end
