class User < ApplicationRecord
  has_many :cheer_ups
  has_many :reviews
  # validates :username, presence: true, uniqueness: true
  has_secure_password
end
