class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :new
      t.string :name
      t.string :email
      t.string :image_url
      t.boolean :admin
      t.boolean :soundfriend
      t.string :instagram
      t.string :twitter

      t.timestamps null: false
    end
  end
end
