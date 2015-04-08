class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.date :review_date
      t.string :name_of_reviewer
      t.boolean :flight_review, :default => false
      t.boolean :instrument_proficiency_check, :default => false
      t.boolean :cfi_renewal, :default => false

      t.timestamps null: false
    end
  end
end
