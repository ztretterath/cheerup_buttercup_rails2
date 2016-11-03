class Review < ApplicationRecord
  belongs_to :cheer_up
  belongs_to :user
end
