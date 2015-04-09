class ChangeMedicalClassToNewName < ActiveRecord::Migration
  def change
    remove_column :medicals, :class, :integer
    add_column :medicals, :medical_class, :integer
  end
end
