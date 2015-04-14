class AddFlightToCheckrides < ActiveRecord::Migration
  def change
    add_reference :checkrides, :flight, index: true
    add_foreign_key :checkrides, :flights
  end
end
