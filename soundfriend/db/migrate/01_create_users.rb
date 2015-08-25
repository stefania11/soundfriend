class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :image_url
      t.string :instagram
      t.string :twitter
      t.timestamps null: false
    end
  end
end
