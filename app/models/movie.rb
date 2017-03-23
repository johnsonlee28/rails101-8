class Movie < ApplicationRecord
  mount_uploader :image, ImageUploader

  has_many :favorites

end
