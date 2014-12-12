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

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
      @user.update(users_params)
      if @user.save
        redirect_to root_path, notice: "Account Information has been updated."
      else
        redirect_to root_path, notice: "No change was made to your account."
      end

  end

  def create
    username = params[:user][:username]
    if User.find_by(username: username) != nil
      redirect_to new_user_path, notice: "Username already in use"
    else
      @user = User.new(users_params)
    end

    if @user != nil && @user.save
      NewsMailer.welcome(@user.id).deliver if @user.email != nil
      redirect_to root_path, notice: "New Account Created. Please login"
    else
      redirect_to create_path, notice: "Failed to create account."
    end
  end

  def users_params
    params.require(:user).permit(:username,  :email, :display_name, :password)
  end

end
