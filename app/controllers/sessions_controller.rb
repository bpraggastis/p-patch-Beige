class SessionsController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: :create
  skip_before_filter :logged_in, only: :create

  def create
    
  end
end
