class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      log_in @user
      redirect_to @user, notice: "You have successfully signed up!"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update user_params
      redirect_to @user, notice: "User successfully updated."
    else
      render :edit
    end
  end

  def destroy
    if @user.destroy
      redirect_to users_path, notice: "User deleted."
    else
      redirect_to @user
    end
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password)
    end

    def set_user
      @user = User.find params[:id]
    end
end
