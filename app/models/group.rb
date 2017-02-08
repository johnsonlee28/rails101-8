class Group < ApplicationRecord
  validates :title, presence: true

  belongs_to :user
  has_many :posts
  has_many :grouprelationships
  has_many :members, :through => :grouprelationships, :source => :user
end
