class AddTextAttrToPostComments < ActiveRecord::Migration
  def change
    add_column :post_comments, :text, :text
  end
end
