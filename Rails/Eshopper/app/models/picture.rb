class Picture < ActiveRecord::Base
  belongs_to :imageable, polymorphic: true
  #mount_uploader :picture, PictureUploader
  mount_uploader :image, ImageUploader
end
