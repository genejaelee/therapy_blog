class AddPostUserIdToPostComments < ActiveRecord::Migration
  def change
    add_column :post_comments, :post_id, :integer
    add_column :post_comments, :user_id, :integer
  end
end
