class RenameTitreColumnToReviwes < ActiveRecord::Migration[5.2]
  def change
    rename_column :reviews, :player_id, :bleager_id
  end
end
