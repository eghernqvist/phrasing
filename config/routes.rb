Rails.application.routes.draw do
  resources Phrack.route, as: 'phrack_phrases', controller: 'phrack_phrases', only: [:index, :edit, :update, :destroy] do
    collection do
      get 'help'
      get 'import_export'
      get 'sync'
      get 'download'
      post 'upload'
      put 'remote_update_phrase'
    end
  end
  resources :phrack_phrase_versions, as: 'phrack_phrase_versions', controller: 'phrack_phrase_versions', only: [:destroy]
end
