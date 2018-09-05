class CreateEpisodes < ActiveRecord::Migration[5.2]
  def change
    create_table :episodes do |t|
      t.string :title
      t.string :description
      t.string :audio
      t.string :episode_id
      t.integer :audio_length

      t.timestamps
    end
  end
end
