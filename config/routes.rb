Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  constraints subdomain: /^house-api(\.|$)/ do
    
    scope module: 'apis/house', path: 'house/v1' do
      get '/:event_type', to: 'events#new'  
    end
    
  end
  
end
