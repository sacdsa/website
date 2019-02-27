Rails.application.routes.draw do

  devise_for :admins, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get '/events', to: 'events#index', as: :events
  get '/events/:id/:slug', to: 'events#show', as: :event
  post '/events/:id/rsvp', to: 'events#rsvp', as: :rsvp

  get 'join' => 'static#join'
  get 'donate' => 'static#donate'

  get 'blog', to: 'blog_posts#index', as: 'blog_posts'
  get 'blog/:year/:month/:day/:slug', to: 'blog_posts#show', as: 'blog_post'
  post 'signup', to: 'signups#create', as: 'signup'

  ## API
  post 'external/signup-majority', to: 'signups#signup_majority', constraints: lambda { |req| req.format == :json }
  get 'memberships/check', to: 'memberships#check'

  ## External/Legacy support ##
  get 'r', to: 'application#handle_redirect'
  get 'unsubscribe', to: 'application#handle_unsubscribe'
  #############################

  get '/404', to: 'errors#not_found'
  get '/500', to: 'errors#internal_error'

  get 'auth/oauth2/callback' => 'auth0#callback'
  get 'auth/logout' => 'auth0#logout'
  get 'auth/failure' => 'auth0#failure'

  get '*slug', to: 'pages#show', as: 'page'

  ## Webhooks
  scope '/webhooks' do
    post '/meeting_sign_in', to: 'webhooks#meeting_sign_in'
    post '/new_event', to: 'webhooks#new_event'
  end

  root to: 'pages#home'
end
