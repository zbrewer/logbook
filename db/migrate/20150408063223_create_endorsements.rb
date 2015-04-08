class CreateEndorsements < ActiveRecord::Migration
  def change
    create_table :endorsements do |t|
      t.date :endorsement_date
      t.string :cfi_name
      t.integer :cfi_certificate_number
      t.date :cfi_expiration_date
      t.boolean :complex, :default => false
      t.boolean :high_performance, :default => false
      t.boolean :tailwheel, :default => false
      t.boolean :high_altitude, :default => false

      t.timestamps null: false
    end
  end
end
