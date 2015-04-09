class AddUserToEndorsements < ActiveRecord::Migration
  def change
    add_reference :endorsements, :user, index: true
    add_foreign_key :endorsements, :users
  end
end
