class CreateSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriptions do |t|
      t.string :website
      t.string :publisher
      t.string :title
      t.string :country
      t.string :image
      t.string :rss
      t.string :language
      t.string :thumbnail
      t.string :description
      t.string :ep_id
      t.references :playlist, foreign_key: {on_delete: :cascade}

      t.timestamps
    end
  end
end
