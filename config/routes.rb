Rails.application.routes.draw do
  resources :results
  resources :users
  get '/', to: 'quiz#index'
  get '/quiz', to: 'quiz#index'
  get '/getQuestionData.json', to: 'quiz#get_questions'
end
