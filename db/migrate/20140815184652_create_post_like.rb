class CreatePostLike < ActiveRecord::Migration
  def change
    create_table :post_likes do |t|

      t.timestamps
    end
  end
end
