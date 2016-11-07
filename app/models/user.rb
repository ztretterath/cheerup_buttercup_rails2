class User < ApplicationRecord
  # Had to add `dependent: :destroy` to these relationships to allow the user to
  # be deleted.  We do not want this.  We want a user's cheerups and reviews to
  # persist even if the user is deleted.  This may not be possible on a
  # relational database, and we were unable to find a solution.
  has_many :cheer_ups, dependent: :destroy
  has_many :reviews, dependent: :destroy
  # validates :username, presence: true, uniqueness: true
  has_secure_password
end
