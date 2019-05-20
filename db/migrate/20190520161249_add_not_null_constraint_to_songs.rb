class AddNotNullConstraintToSongs < ActiveRecord::Migration[5.2]
  def change
    change_column_null :songs, :title, false
    change_column_null :songs, :released, false
    change_column_null :songs, :duration, false
  end
end
