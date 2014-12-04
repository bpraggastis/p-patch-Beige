require 'rails_helper'
require 'spec_helper'

describe SessionsController do

  before do  #from https://github.com/intridea/omniauth/wiki/Integration-Testing
    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:developer]
    @user = User.create(
    username: request.env["omniauth.auth"].info.username,
    email: request.env["omniauth.auth"].info.email,
    admin_rights: request.env["omniauth.auth"].info.admin_access_code
    )
  end


  it "should create and destroy a session" do
    expect(session[:user_id]).to eq nil
    post :create
    expect(session[:user_id]).not_to eq nil
    post :destroy
    expect(session[:user_id]).to eq nil
  end




end
