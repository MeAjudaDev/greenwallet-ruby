Rails.application.routes.draw do
  get 'users_shareds/index'
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

    # Rota Main
    root to: 'application#index'

    # Prefixo API/V1
    namespace :api do
        namespace :v1 do
            get 'settings', to: 'settings#index'
            get 'settings/:id', to: 'settings#indentify'
            post 'settings', to: 'settings#post'

            resources :settings_graphic
            resources :users_shareds
        end
    end

end
