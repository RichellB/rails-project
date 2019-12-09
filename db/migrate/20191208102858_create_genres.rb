class CreateGenres < ActiveRecord::Migration[4.2]
  def change
    create_table :genres do |t|
      t.string :name
      t.string :artist_id
      t.string :song_id

      t.timestamps null: false
    end
  end
end
