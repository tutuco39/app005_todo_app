class AddTodoFieldsToMemos < ActiveRecord::Migration[7.2]
  def change
    add_column :memos, :completed, :boolean, null: false, default: false
    add_column :memos, :due_on, :date
    add_index  :memos, :completed
    add_index  :memos, :due_on
  end
end
