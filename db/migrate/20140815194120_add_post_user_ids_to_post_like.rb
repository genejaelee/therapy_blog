class AddPostUserIdsToPostLike < ActiveRecord::Migration
  def change
    add_column :post_likes, :post_id, :integer
    add_column :post_likes, :user_id, :integer
  end
end
