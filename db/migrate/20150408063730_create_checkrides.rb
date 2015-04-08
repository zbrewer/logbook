class CreateCheckrides < ActiveRecord::Migration
  def change
    create_table :checkrides do |t|
      t.date :checkride_date
      t.string :examiner_name
      t.boolean :cfi, :default => false
      t.boolean :cfii, :default => false
      t.boolean :instrument, :default => false
      t.boolean :certificate, :default => false
      t.string :certificate_type, :default => false
      t.boolean :single_engine_land, :default => false
      t.boolean :single_engine_sea, :default => false
      t.boolean :multi_engine_land, :default => false
      t.boolean :multi_engine_sea, :default => false
      t.boolean :rotorcraft, :default => false
      t.boolean :glider, :default => false
      t.boolean :powered_lift, :default => false
      t.boolean :lighter_than_air, :default => false

      t.timestamps null: false
    end
  end
end
