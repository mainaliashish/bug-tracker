class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.integer :project_manager_id
      t.integer :developer_id, null: true

      t.timestamps
    end
  end
end
