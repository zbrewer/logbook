class CreateAirplanes < ActiveRecord::Migration
  def change
    create_table :airplanes do |t|
      t.string :identification
      t.string :type
      t.boolean :complex, :default => false
      t.boolean :high_performance, :default => false
      t.boolean :tailwheel, :default => false
      t.boolean :high_altitude, :default => false
      t.boolean :turbine, :default => false
      t.boolean :glider, :default => false
      t.boolean :rotorcraft, :default => false
      t.boolean :powered_lift, :default => false
      t.boolean :lighter_than_air, :default => false
      t.boolean :single_engine_land, :default => false
      t.boolean :single_engine_sea, :default => false
      t.boolean :multi_engine_land, :default => false
      t.boolean :multi_engine_sea, :default => false
      t.boolean :simulator, :default => false
      t.string :display_name

      t.timestamps null: false
    end
  end
end
