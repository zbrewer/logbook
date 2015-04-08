class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.date :flight_date
      t.decimal :total_time, :default => 0
      t.decimal :pic_time, :default => 0
      t.decimal :sic_time, :default => 0
      t.decimal :dual_received, :default => 0
      t.decimal :dual_given, :default => 0
      t.integer :day_landings, :default => 0
      t.integer :night_landings, :default => 0
      t.decimal :actual_instrument, :default => 0
      t.decimal :simulated_instrument, :default => 0
      t.integer :number_approaches, :default => 0
      t.integer :number_holds, :default => 0
      t.text :remarks
      t.string :departure_airport
      t.string :destination_airports
      t.decimal :night_time, :default => 0
      t.decimal :cross_country_time, :default => 0
      t.decimal :solo_time, :default => 0

      t.timestamps null: false
    end
  end
end
