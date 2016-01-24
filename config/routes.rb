Rails.application.routes.draw do
  resources :users
  get '/quiz', to: 'quiz#index'
  get '/getQuestionData.json', to: 'quiz#get_questions'
end
