class SoundsController < ApplicationController
  before_action :set_sound, only: [:show, :edit, :update, :destroy]

  def index
    @sounds = Sound.all
  end

  def new
    @sound = Sound.new
  end

  def create
    @sound = Sound.new sound_params
    if @sound.save
      redirect_to root_path, notice: "Sound has been saved."
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
      redirect_to @sound, notice: "Sound updated."
    else
      render :edit
    end
  end

  def destroy
    if @sound.destroy
      redirect_to root_path, notice: "Sound deleted."
    else
      redirect_to @sound, error: "Sound could not be deleted."
    end
  end

  private
    def sound_params
      params.require(:sound).permit(:name, :audio)
    end

    def set_sound
      @sound = Sound.find params[:id]
    end
end
