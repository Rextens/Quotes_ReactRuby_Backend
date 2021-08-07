Rails.application.routes.draw do
  devise_for :users,
               path: 'api/v1/',
               path_names: {
                 sign_in: 'login',
                 sign_out: 'logout',
                 registration: 'signup'
               },
               controllers: {
                 sessions: 'sessions',
                 registrations: 'registrations'
               }
               
  resources :quotes_clouds
  get 'quotes/index'
  get 'quotes/create'
  get 'quotes/udpate'
  get 'quotes/destroy'
  get 'api/v1/quotes/randomQuotes', to: "quotes#randomQuotes"
  post 'api/v1/quotes/makeChoice', to: "quotes#makeChoice"

#  get 'api/v1/signIn', to: "devise/sessions#new"
#  post 'api/v1/signIn', to: "devise/sessions#create"
#  delete 'api/v1/signOut', to: "devise/sessions#destroy"

#  get 'api/v1/users/password/new', to: "devise/passwords#new"
#  get 'api/v1/users/password/edit', to: "devise/passwords#edit"
#  patch ' api/v1/users/password', to: "devise/passwords#update"
#  put 'api/v1/users/password', to: "devise/passwords#update"
#  post 'api/v1/users/password', to: "devise/passwords#create"

#  get 'api/v1/users/cancel', to: "devise/registrations#cancel"
#  get 'api/v1/users/sign_up', to: "devise/registrations#new"
#  get 'api/v1/users/edit', to: "devise/registrations#edit"
#  patch 'api/v1/users', to: "devise/registrations#update"
#  put 'api/v1/users', to: "devise/registrations#update"
#  delete 'api/v1/users', to: "devise/registrations#destroy"
#  post 'api/v1/users', to: "devise/registrations#create"


#  post 'api/v1/user/login', to: "user#login"
#  post 'api/v1/user/register', to: "user#register"

  scope '/api/v1' do
    resources :quotes
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
