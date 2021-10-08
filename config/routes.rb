Rails.application.routes.draw do

    root to: "home#index"
    get 'home/index'
    
    devise_for :users
    resources :users


    # fait qu'on a plus PostsController mais Users::PostsController => création d'un folder controllers/users avec post controller dedans
    # le folder views/post est aussi déplacé dans views/users
    scope module: 'users' do 
        resources :posts
    end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
