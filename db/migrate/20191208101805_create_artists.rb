class CreateArtists < ActiveRecord::Migration[4.2]
  def change
    create_table :artists do |t|
      t.string :name
      t.text :email
      t.string :username
      t.string :password_digest
      t.timestamps
    end
  end
end
