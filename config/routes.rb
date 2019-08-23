Rails.application.routes.draw do
  root to: "home#index"

  devise_for :users,
    controllers:{omniauth_callbacks: "users/omniauth_callbacks"}

  as :user do
    get "signup", to: "devise/registrations#new"
    get "signin", to: "devise/sessions#new"

    post "signup", to: "devise/registrations#create"
    post "signin", to: "devise/sessions#create"

    delete "signout", to: "devise/sessions#destroy"
  end

  resources :users, only: %i(show)

  namespace :admin do
    get "index", to: "courses#index"
    resources :courses, except: :show
    resources :users
    resources :words
    resources :questions
  end

  get "follow/:follow_user_id", to: "users#follow", as: "follow"
  get "unfollow/:unfollow_user_id", to: "users#unfollow", as: "unfollow"
  get "course/:course_id/words", to: "words#index", as: "learn_words"
  get "course/:course_id/do-lesson", to: "lessons#do_lesson", as: "do_lesson"
  get "course/:user_id/:course_id/:result_id/view-result", to: "lessons#view_result", as: "view_result"
  get "word-learned", to: "words#view_word", as: "view_word"
  get "/search", to:"courses#search"

  post "lesson/submit-answer", to: "lessons#submit_answer", as: "submit_answer"
end
