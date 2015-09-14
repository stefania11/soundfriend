class RenameUsersIdToUserIdOnPosts < ActiveRecord::Migration
  def change
    rename_column :posts, :users_id, :user_id
  end
end
