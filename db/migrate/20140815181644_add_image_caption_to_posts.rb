class AddImageCaptionToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :image_caption, :text
  end
end
