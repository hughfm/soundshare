class AddAudioToSounds < ActiveRecord::Migration
  def change
    add_column :sounds, :audio_id, :string
  end
end
