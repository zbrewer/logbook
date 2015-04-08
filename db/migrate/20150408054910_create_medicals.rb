class CreateMedicals < ActiveRecord::Migration
  def change
    create_table :medicals do |t|
      t.date :exam_date
      t.decimal :class
      t.string :examiner_name

      t.timestamps null: false
    end
  end
end
