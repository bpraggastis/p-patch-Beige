require 'rails_helper'
require 'spec_helper'

describe UsersController do


  #create a hash for params


  describe "#create" do
    let(:params)  {{user:
      {  username: "betty",
        email: "betty@bedrock.us"}}
      }
    it 'creates a user' do
      post :create
      expect
    end
  end

end
