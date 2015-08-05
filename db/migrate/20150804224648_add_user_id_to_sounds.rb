class AddUserIdToSounds < ActiveRecord::Migration
  def change
    add_column :sounds, :user_id, :integer
  end
end
