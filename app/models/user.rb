class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :groups
  has_many :posts
  has_many :grouprelationships
  has_many :participated_groups, :through => :grouprelationships, :source => :group

  has_many :favorites
  has_many :favorite_movies, :through => :favorites, :source => :movie

  has_many :reviews
  has_many :movies, through: :reviews, source: :movie


  def is_member_of?(group)
    participated_groups.include?(group)
  end

  def join!(group)
    participated_groups << group
  end

  def quit!(group)
    participated_groups.delete(group)
  end

  def is_favorite_of?(job)
    favorite_movies.include?(job)
  end
end
