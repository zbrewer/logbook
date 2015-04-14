class AddAirplaneToFlight < ActiveRecord::Migration
  def change
    add_reference :flights, :airplane, index: true
    add_foreign_key :flights, :airplanes
  end
end
