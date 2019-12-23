class CreateSongs < ActiveRecord::Migration[4.2]
  def change
    create_table :songs do |t|
      t.string :title 
      t.string :album_name
      t.string :artist_name
      t.string :genre_name
      t.string :release_year
      #t.integer :artist_id
      
      t.timestamps
      end
  end
end
