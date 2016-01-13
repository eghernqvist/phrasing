Dummy::Application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  root to: "site#index"
end
