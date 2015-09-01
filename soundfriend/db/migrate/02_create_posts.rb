class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.belongs_to :users, index: true
      t.string :name
      t.text :track_url
      t.timestamps null: false
    end
  end
end
