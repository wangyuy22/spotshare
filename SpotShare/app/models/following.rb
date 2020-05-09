class Following < ApplicationRecord
  belongs_to :user
  belongs_to :playlist

  validates :playlist, uniqueness: { scope: :user }
  validates :user, uniqueness: { scope: :playlist }
end
