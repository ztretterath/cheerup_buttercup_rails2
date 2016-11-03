class User < ApplicationRecord
  has_many :cheer_ups
  has_many :reviews
end
