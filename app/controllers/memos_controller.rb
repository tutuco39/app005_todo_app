class MemosController < ApplicationController
  before_action :set_memo, only: %i[ show edit update destroy toggle ]

  # ① 未完了を期日順で
  def index
    @memos = Memo.incomplete.order_due
  end

  # ③ 完了済みページ
  def completed
    @memos = Memo.completed.order_due
    render :index
  end

  def show; end
  def new;  @memo = Memo.new; end
  def edit; end

  def create
    @memo = Memo.new(memo_params)
    if @memo.save
      redirect_to memos_url, notice: "メモを作成しました。"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @memo.update(memo_params)
      redirect_to memos_url, notice: "メモを更新しました。"
    else
      render :edit, status: :unprocessable_entity
    end
  end


  def destroy
    @memo.destroy!
    redirect_to memos_url, notice: "メモを削除しました。"
  end

  # ② チェックで完了/未完を切替え（Turboで即反映）
def toggle
  @memo.update!(completed: !@memo.completed)
  respond_to do |format|
    format.turbo_stream   # ← .turbo_stream テンプレートを探す
    format.html {
      redirect_to(@memo.completed ? completed_memos_path : memos_path, notice: "状態を更新しました。") 
    }
  end
end


  private
    def set_memo
      @memo = Memo.find(params[:id])
    end

    def memo_params
      params.require(:memo).permit(:title, :due_on, :completed)
    end
end
