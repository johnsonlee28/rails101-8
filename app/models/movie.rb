class Movie < ApplicationRecord
  mount_uploader :image, ImageUploader

  has_many :favorites

  has_many :reviews
  has_many :users, through: :reviews, source: :user

  has_many :topics

end
