class AddNullContstraintToArtistId < ActiveRecord::Migration[5.2]
  def change
    change_column_null :songs, :artist_id, default: false
  end
end
