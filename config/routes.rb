Rails.application.routes.draw do

  resources :elements
    root to: "home#index"
    get 'home/index'
    
    devise_for :users
    resources :users


    # fait qu'on a plus PostsController mais Users::PostsController => création d'un folder controllers/users avec post controller dedans
    # le folder views/post est aussi déplacé dans views/users
    # idem le element controller est déplace dans users et passé en usersController
    # element controller est nested
    scope module: 'users' do 
        resources :posts do
            resources :elements
        end
    end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
