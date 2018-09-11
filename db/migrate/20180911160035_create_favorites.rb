class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.references :user, foreign_key: {on_delete: :cascade}
      t.references :subscription, foreign_key: {on_delete: :cascade}
      t.timestamps
    end
  end
end
