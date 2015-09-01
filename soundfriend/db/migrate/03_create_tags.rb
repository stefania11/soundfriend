class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.belongs_to :posts, index: true
      t.belongs_to :users, index: true
      t.timestamps null: false
    end
  end
end
