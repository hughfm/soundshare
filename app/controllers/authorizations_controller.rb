class AuthorizationsController < ApplicationController
  def create
    @sound = Sound.find(params[:authorizations][:sound_id])
    authorize @sound, :share?
    user_ids = params[:authorizations][:user_ids].reject { |item| @sound.authorized_users.ids.map(&:to_s).include? item }
    users = User.find(user_ids)
    @sound.authorized_users << users
    redirect_to @sound
  end

  def destroy
    @authorization = Authorization.find(params[:id])
    authorize(@authorization)
    @authorization.destroy
    redirect_to @authorization.sound
  end
end
