class SessionsController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: :create


  #I don't believe we need the above two lines.
  # see: http://stackoverflow.com/questions/1730377/receive-post-from-external-form

  def create
    @user = User.find_by(username: params[:username], password: params[:password])
    @auth = request.env["omniauth.auth"]
    if @user == nil && @auth == nil
      reject_credentials
    else
      if @user != nil
        start_session(user_id)
      elsif check_credentials(@auth.uid) != nil
        start_session(check_credentials(@auth.uid).id)
      else
        user = User.new_twitter_user(@auth.uid)
        start_session(user.id)
      end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  def index
    current_user
  end

  def start_session(user_id)
    session[:user_id] = user_id
    redirect_to user_path(user_id)
  end

  def reject_credentials
    redirect_to root_path, notice: "Login credentials not recognized."
  end

  def check_credentials
    User.find_by(uid: request.env["omniauth.auth"].uid)
  end


end
