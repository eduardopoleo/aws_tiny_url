Rails.application.routes.draw do
  resource :url, only: [:create]
  get '/:slug', to: 'urls#show'
end
