class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.string :title
      t.date   :released
      t.string :duration
      t.timestamps
    end
  end
end
