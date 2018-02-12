Rails.application.routes.draw do
  # get 'games/new'
  get 'new', to: 'games#new', as: :new

  get 'score', to: 'games#score', as: :score
  # get 'games/score'

  # get 'games_controller/new'

  # get 'games_controller/score'
  post 'score', to: 'games#score', as: :result

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
