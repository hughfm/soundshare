class AddMetaDataToSounds < ActiveRecord::Migration
  def change
    add_column :sounds, :audio_filename, :string
    add_column :sounds, :audio_size, :integer
    add_column :sounds, :audio_content_type, :string
  end
end
