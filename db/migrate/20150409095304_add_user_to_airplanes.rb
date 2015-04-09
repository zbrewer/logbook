class AddUserToAirplanes < ActiveRecord::Migration
  def change
    add_reference :airplanes, :user, index: true
    add_foreign_key :airplanes, :users
  end
end
