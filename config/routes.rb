Refinery::Application.routes.draw do
  resources :routes, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :routes, :except => :show do
      collection do
        get :redirections
      end
    end
  end
end
