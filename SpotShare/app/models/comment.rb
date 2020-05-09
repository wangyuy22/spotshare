class Comment < ApplicationRecord
  belongs_to :playlist
  belongs_to :user
end
