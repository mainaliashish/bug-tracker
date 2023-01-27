class AddIdentifierForRoles < ActiveRecord::Migration[7.0]
  def change
    add_column :roles, :identifier, :string
  end
end
