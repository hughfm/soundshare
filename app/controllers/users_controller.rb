class UsersController < Clearance::UsersController
  skip_after_action :verify_authorized, only: [:new, :create]

  def index
    @users = policy_scope(User.order(last_name: :asc).paginate(page: params[:page]))
  end

  def show
    @user = User.find(params[:id])
    authorize @user

    if current_user == @user
      @sounds = @user.sounds.order(created_at: :desc)
    elsif signed_in?
      @sounds = current_user.sounds_by(@user)
    else
      @sounds = @user.sounds.public_share
    end
  end

  def edit
    @user = User.find(params[:id])
    authorize @user
  end

  def update
    @user = User.find(params[:id])
    authorize @user

    params[:user].delete :password
    params[:user].delete :password_confirmation

    unless params[:user][:new_password].blank?
      if @user.authenticated? params[:user][:current_password]
        params[:user][:password] = params[:user][:new_password]
        params[:user][:password_confirmation] = params[:user][:new_password_confirmation]
      else
        flash[:alert] = "Please check your password and try again."
        redirect_to(edit_user_path(@user)) and return
      end
    end

    if @user.update user_params
      flash[:success] = "Account updated successfully."
      redirect_to edit_user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])

    if @user.destroy
      flash[:success] = "User deleted."
      redirect_to users_path
    else
      redirect_to @user
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def user_from_params
    params[:user] ? User.new(user_params) : User.new
  end

end
