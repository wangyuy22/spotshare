class Playlist < ApplicationRecord
  has_many :followings, dependent: :destroy
  has_many :users, through: :followings

  has_many :songs, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true
  validates :title, uniqueness: true
  
  

end

