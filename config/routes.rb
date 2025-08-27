Rails.application.routes.draw do  
  mount Pixelpress::Engine => "rails" if Rails.env.development?
  devise_for :users
  get 'home/index'
  root "home#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  get "users/registrar",to: "users#registrar"
  post "users/guardar_usuario", to: "users#guardar_usuario"
  post "datos_personals/guardar_datos", to: "datos_personals#guardar_datos"
  get "documentos/captura_doc", to: "documentos#captura_doc"
  post "documentos/guardar_captura", to: "documentos#guardar_captura"
  post "home/cargar_tabla_principal", to: "home#cargar_tabla_principal"

  resources :datos_personals
  resources :documentos
end
