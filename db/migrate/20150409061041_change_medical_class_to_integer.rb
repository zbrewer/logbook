class ChangeMedicalClassToInteger < ActiveRecord::Migration
  def change
    change_column :medicals, :class, :integer
  end
end
