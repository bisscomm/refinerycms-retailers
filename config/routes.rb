Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :retailers do
    resources :retailers, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :retailers, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :retailers, :except => :show do
        collection do
          post :update_positions
        end
      end

      get '/retailers/subregion_options' => 'retailers#subregion_options'
    end
  end
end