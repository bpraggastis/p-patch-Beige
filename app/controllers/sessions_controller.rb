class SessionsController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: :create


  #I don't believe we need the above two lines.
  # see: http://stackoverflow.com/questions/1730377/receive-post-from-external-form

  def create
    @user = User.find_by(
      username: request.env["omniauth.auth"].info.username,
      email: request.env["omniauth.auth"].info.email,
      admin_rights: request.env["omniauth.auth"].info.admin_access_code
      )
    if @user != nil
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    else
      redirect_to root_path, notice: "Login credentials not recognized."
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  def index
    current_user
  end


end
