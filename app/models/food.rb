class Food < ApplicationRecord
resourcify
mount_uploader :image, ImageUploader
belongs_to :user

has_many :comments, :dependent => :destroy

end
