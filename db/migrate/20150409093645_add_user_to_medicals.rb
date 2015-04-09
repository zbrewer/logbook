class AddUserToMedicals < ActiveRecord::Migration
  def change
    add_reference :medicals, :user, index: true
    add_foreign_key :medicals, :users
  end
end
