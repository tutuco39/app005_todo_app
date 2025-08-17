require "application_system_test_case"

class MemosTest < ApplicationSystemTestCase
  setup do
    @memo = memos(:one)
  end

  test "visiting the index" do
    visit memos_url
    assert_selector "h1", text: "ToDoメモ（未完了）"
  end

  test "should create memo" do
    visit memos_url
    click_on "新規作成"

    # ラベルを日本語にしたので、フィールドIDで入れると堅牢
    fill_in "memo_content", with: @memo.content
    fill_in "memo_title", with: @memo.title

    click_on "Create Memo"

    assert_text "メモを作成しました。"
  end

  test "should update Memo" do
    visit memo_url(@memo)
    click_on "Edit this memo", match: :first

    fill_in "memo_content", with: @memo.content
    fill_in "memo_title", with: @memo.title

    click_on "Update Memo"

    assert_text "メモを更新しました。"
  end

  test "should destroy Memo" do
    visit memo_url(@memo)
    click_on "Destroy this memo", match: :first

    assert_text "メモを削除しました。"
  end
end
