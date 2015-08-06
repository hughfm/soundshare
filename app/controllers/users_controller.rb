class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :edit_password, :update_password]
  before_action :logged_in_user, only: [:edit, :update]
  before_action :correct_user, only: [:edit, :update, :destroy, :edit_password, :update_password]

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
      flash[:success] = "You have successfully signed up!"
      redirect_to edit_user_path(@user)
    else
      render :new
    end
  end

  def show
    if current_user?(@user)
      @sounds = @user.sounds
    else
      @sounds = @user.sounds.public_share
    end
  end

  def edit
  end

  def update
    if @user.update user_params
      flash[:success] = "User successfully updated."
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = "User deleted."
      redirect_to users_path
    else
      redirect_to @user
    end
  end

  def edit_password
  end

  def update_password
    if @user.update user_params
      flash[:success] = "Password changed successfully."
      redirect_to @user
    else
      render :edit_password
    end
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end

    def set_user
      @user = User.find_by id: params[:id]
    end

    def correct_user
      unless current_user?(@user)
        flash[:danger] = "Woops! You are not authorised to perform that action."
        redirect_to(root_url)
      end
    end
end
