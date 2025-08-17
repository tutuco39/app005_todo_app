class Memo < ApplicationRecord
  # ① 期日順（未設定は最後）に並べる
  scope :order_due, -> {
    order(Arel.sql("CASE WHEN due_on IS NULL THEN 1 ELSE 0 END, due_on ASC, id ASC"))
  }

  # ②/③ 未完了・完了の切り分け
  scope :incomplete, -> { where(completed: false) }
  scope :completed,  -> { where(completed: true) }

  validates :title, presence: true, length: { maximum: 100 }

end