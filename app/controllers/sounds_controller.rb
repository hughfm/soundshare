class SoundsController < ApplicationController
  skip_before_action :require_login, only: [:index, :show]
  skip_after_action :verify_policy_scoped, only: [:index]

  def index
    if signed_in?
      @sounds = current_user.sound_feed.paginate(page: params[:page])
    else
      @sounds = Sound.public_share.paginate(page: params[:page])
    end
  end

  def new
    @sound = current_user.sounds.build
    authorize @sound
  end

  def create
    @sound = current_user.sounds.build sound_params
    authorize @sound

    if @sound.save
      flash[:success] = "Sound has been saved."
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @sound = Sound.find params[:id]
    authorize @sound
    @authorizations = @sound.authorizations if @sound.owned_by?(current_user)
  end

  def edit
    @sound = Sound.find params[:id]
    authorize @sound
  end

  def update
    @sound = Sound.find params[:id]
    authorize @sound

    if @sound.update sound_params
      flash[:success] = "Sound updated."
      redirect_to @sound
    else
      render :edit
    end
  end

  def destroy
    @sound = Sound.find params[:id]
    authorize @sound

    if @sound.destroy
      flash[:success] = "Sound deleted."
      redirect_to root_path
    else
      flash[:danger] = "Sound could not be deleted."
      redirect_to @sound
    end
  end

  def share
    @sound = Sound.find params[:id]
    authorize @sound
    @users = User.where.not(id: current_user.id)
  end

  private

  def sound_params
    params.require(:sound).permit(:name, :audio, :public)
  end
end
