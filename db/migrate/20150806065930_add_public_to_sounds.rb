class AddPublicToSounds < ActiveRecord::Migration
  def change
    add_column :sounds, :public, :boolean
  end
end
