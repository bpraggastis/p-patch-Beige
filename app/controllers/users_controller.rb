class UsersController < ApplicationController


  skip_before_filter :verify_authenticity_token, only: :create
  before_filter :current_user



  def show
    current_user
    @user = User.find(params[:id])
  end

  def new
    @user = User.new()
  end

  def create
    username, password, email, display_name =
                                params[:user][:username],
                                params[:user][:password],
                                params[:user][:email],
                                params[:user][:display_name]
    if User.find_by(username: username) != nil
      redirect_to :back, notice: "Username already in use"
    else
      @user = User.new(
        username: username,
        email: email,
        password: password,
        display_name: display_name
        )
    end
    if @user.save
      redirect_to root_path, notice: "New Account Created. Please login"
    else
      redirect_to create_path, notice: "Failed to create account."
    end
  end

end
