class CreatePostComments < ActiveRecord::Migration
  def change
    create_table :post_comments do |t|

      t.timestamps
    end
  end
end
