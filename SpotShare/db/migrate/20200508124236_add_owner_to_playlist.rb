class AddOwnerToPlaylist < ActiveRecord::Migration[5.2]
  def change
    add_column :playlists, :owner, :string
  end
end
