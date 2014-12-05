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
    @user = User.create(
    username: params[:user][:username],
    email: params[:user][:email],
    admin_rights: params[:user][:admin_rights]
    )
    if @user.save
      redirect_to root_path, notice: "New Account Created."
    else
      redirect_to create_path, notice: "Failed to create account."
    end
  end


end
