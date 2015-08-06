class RenameAuthorizationsTable < ActiveRecord::Migration
  def change
    rename_table :authorizarions, :authorizations
  end
end
