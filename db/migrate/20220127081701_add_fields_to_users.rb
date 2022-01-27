class AddFieldsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :role_id, :integer
    add_column :users, :profile_photo, :string, null: true
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
  end
end
