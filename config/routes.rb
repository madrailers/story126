Story126::Application.routes.draw do
  resources :stories
  root :to => 'welcome#index'
end
