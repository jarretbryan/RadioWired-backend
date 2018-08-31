class CreateGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :genres do |t|
      t.string :name
      t.integer :api_id

      t.timestamps
    end
  end
end
