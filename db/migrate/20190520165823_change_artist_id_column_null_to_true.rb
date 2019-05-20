class ChangeArtistIdColumnNullToTrue < ActiveRecord::Migration[5.2]
  def change
    change_column_null :songs, :artist_id, true
  end
end
