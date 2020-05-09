class User < ApplicationRecord
  has_many :followings, dependent: :destroy
  has_many :playlists, through: :followings
  has_many :comments, dependent: :destroy
  has_one_attached :avatar


  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true
  validates :password_hash, presence: true
  validates :username, uniqueness: true

include BCrypt

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def password
    @password ||= BCrypt::Password.new(self.password_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end
end

