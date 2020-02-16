Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  get 'welcome/index'

  get '/', to: redirect('/app/overview')

  # general application frontend
  scope '/app', controller: :app do
    get 'login'
    get 'logout'
    get 'overview'
    get 'settings'
    get 'statistics'
    get 'entries_overview'
    get 'register'
    post 'auth'
    patch 'update_settings'
    post 'register'
    get 'activate/:salt', to: 'app#activate'

    resources :entries
    resources :categories
    get '/categories/:id/svg', to: 'categories#svg'
  end

  # json-api
  scope '/charts', constraints: {year: "[0-9]+", month: "[0-9]+", day: "[0-9]+"} do
    get ':year', to: 'charts#year'
    get ':year/:month', to: 'charts#month'
    get ':year/:month/:day', to: 'charts#day'

    get 'incomes', to: 'charts#incomes'
    get 'expenses', to: 'charts#expenses'
  end

  # all unknown urls to 404
  get '*path', to: 'app#not_found'
end
