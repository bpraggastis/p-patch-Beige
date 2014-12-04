require 'rails_helper'
require 'spec_helper'

describe UsersController do

  describe "#new" do
    it 'creates a User and redirects to his Account page' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "#create" do

    it 'creates a new user' do
      expect{post :create, :user => {username: "betty",
        email: "betty@bedrock.us"}}.to change{User.count}.by(1)
    end

    it 'redirects to account page' do
      post :create, :user => {username: "betty",
        email: "betty@bedrock.us"}
      expect(response).to redirect_to(root_path)

    end
  end

end
