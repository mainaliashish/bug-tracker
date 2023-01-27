class CreateTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :tickets do |t|
      t.string :title
      t.text :description
      t.integer :developer_id, null: true
      t.integer :user_id
      t.integer :project_id
      t.integer :priority, null: true
      t.integer :status, null: true
      t.integer :bug_type, null: true

      t.timestamps
    end
  end
end
