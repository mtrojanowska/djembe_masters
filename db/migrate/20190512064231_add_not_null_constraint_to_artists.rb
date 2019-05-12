class AddNotNullConstraintToArtists < ActiveRecord::Migration[5.2]
  def change
    change_column_null :artists, :nickname, false
    change_column_null :artists, :birthdate, false
    change_column_null :artists, :origin, false
    change_column_null :artists, :biography, false
  end
end
