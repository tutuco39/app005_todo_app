Rails.application.routes.draw do
  root "memos#index"

  resources :memos do
    member { patch :toggle }     # チェックで完了/未完切替
    collection { get :completed } # 完了済み一覧
  end
end
