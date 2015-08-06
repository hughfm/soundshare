class SoundsController < ApplicationController
  before_action :set_sound, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @sounds = Sound.all
  end

  def new
    @sound = current_user.sounds.build
  end

  def create
    @sound = current_user.sounds.build sound_params
    if @sound.save
      flash[:success] = "Sound has been saved."
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @sound.update sound_params
      flash[:success] = "Sound updated."
      redirect_to @sound
    else
      render :edit
    end
  end

  def destroy
    if @sound.destroy
      flash[:success] = "Sound deleted."
      redirect_to root_path
    else
      flash[:danger] = "Sound could not be deleted."
      redirect_to @sound
    end
  end

  private
    def sound_params
      params.require(:sound).permit(:name, :audio)
    end

    def set_sound
      @sound = Sound.find params[:id]
    end

    def correct_user
      redirect_to root_url unless current_user?(@sound.user)
    end
end
