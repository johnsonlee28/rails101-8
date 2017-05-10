class Movie < ApplicationRecord
  mount_uploader :image, ImageUploader

  has_many :favorites

  has_many :reviews
  has_many :users, through: :reviews, source: :user

  has_many :topics

  has_many :tickets, :dependent => :destroy

  accepts_nested_attributes_for :tickets, :allow_destroy => true, :reject_if => :all_blank

end
