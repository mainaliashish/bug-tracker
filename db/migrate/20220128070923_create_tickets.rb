class CreateTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :tickets do |t|
      t.string :title
      t.text :description
      t.integer :developer_id, null: true
      t.integer :project_id
      t.string :priority, null: true
      t.string :status, null: true
      t.string :type, null: true

      t.timestamps
    end
  end
end
