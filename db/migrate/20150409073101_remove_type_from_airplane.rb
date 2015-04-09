class RemoveTypeFromAirplane < ActiveRecord::Migration
  def change
    remove_column :airplanes, :type, :string
    add_column :airplanes, :airplane_type, :string
  end
end
