class Review < ApplicationRecord
  validates :user_id, uniqueness: true
  belongs_to :cheer_up
  belongs_to :user
end
