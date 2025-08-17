class CreateMemos < ActiveRecord::Migration[7.2]
  def change
    create_table :memos do |t|
      t.string :title
      t.text :content
      t.timestamps
    end

    # completed のデフォルトを false にする
    change_column_default :tasks, :completed, from: nil, to: false

    # 検索やソートが速くなるように index を追加
    add_index :tasks, :completed
    add_index :tasks, :due_on

  end
end
