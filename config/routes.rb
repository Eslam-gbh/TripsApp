Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => "/sidekiq"
  namespace 'api' do
    namespace 'v1' do
      resources :trips
      get "/report" => "trips#report", as: "trips_report"
    end
  end
end


