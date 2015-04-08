class AddFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :birth_date, :date
    add_column :users, :certificate_number, :integer
    add_column :users, :certificate_type, :string
    add_column :users, :certificate_issue_date, :date
  end
end
