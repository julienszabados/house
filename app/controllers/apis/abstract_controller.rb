class Apis::AbstractController < ApplicationController
  
  layout false

  skip_before_action :verify_authenticity_token
  
end