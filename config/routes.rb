Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :group_events
    end
  end
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
