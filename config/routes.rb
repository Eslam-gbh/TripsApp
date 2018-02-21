Rails.application.routes.draw do
  resources :rental_units
  namespace 'api' do
    namespace 'v1' do
      resources :trips
    end
  end
end


