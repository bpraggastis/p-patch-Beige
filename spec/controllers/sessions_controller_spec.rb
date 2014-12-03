require 'rails_helper'

RSpec.describe SessionsController, :type => :controller do
  describe "#create" do
    it 'creates a user' do
      OmniAuth.config.add_mock(:developer, {:uid => "12345"})
      request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:developer]
      expect { get :create, provider: "developer" }.to change(User, :count).by(1)
    end
  end
end
