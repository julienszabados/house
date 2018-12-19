Rails.application.routes.draw do
  
  constraints subdomain: /^house-api(\.|$)/ do
    
    scope module: 'apis/house' do
      get 'events/:event_type/new', to: 'events#new'  
    end
    
  end
  
end
