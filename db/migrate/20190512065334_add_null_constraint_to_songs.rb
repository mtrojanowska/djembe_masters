class AddNullConstraintToSongs < ActiveRecord::Migration[5.2]
  def change
    change_column_null :songs, :title, false
    change_column_null :songs, :released, false
    change_column_null :songs, :duration, false
    change_column_null :songs, :artist_id, false
  end
end
