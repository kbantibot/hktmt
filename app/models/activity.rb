class Activity < ApplicationRecord
 resourcify

 mount_uploader :image, ImageUploader
 belongs_to :user
end
