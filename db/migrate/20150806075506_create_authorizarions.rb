class CreateAuthorizarions < ActiveRecord::Migration
  def change
    create_table :authorizarions do |t|
      t.integer :sound_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
