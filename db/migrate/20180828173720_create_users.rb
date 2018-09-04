class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :username
      t.string :profile_image, default: 'https://cdn.pixabay.com/photo/2017/10/15/00/55/headphones-2852336_960_720.png'

      t.timestamps
    end
  end
end
