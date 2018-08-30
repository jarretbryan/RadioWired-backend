class CreatePlaylists < ActiveRecord::Migration[5.2]
  def change
    create_table :playlists do |t|
      t.string :title
      t.string :description
      t.string :genre
      t.references :user, foreign_key: {on_delete: :cascade}

      t.timestamps
    end
  end
end
