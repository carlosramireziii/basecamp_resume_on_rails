class CreateTodoItems < ActiveRecord::Migration[6.0]
  def change
    create_table :todo_items do |t|
      t.belongs_to :todo_list, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true
      t.string :title
      t.boolean :complete, default: false

      t.timestamps
    end
  end
end
