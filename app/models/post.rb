class Post < ActiveRecord::Base
  belongs_to :user
  has_many :post_likes
  has_many :post_comments
  
  mount_uploader :image, ImageUploader
end
