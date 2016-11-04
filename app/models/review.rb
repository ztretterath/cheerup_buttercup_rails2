class Review < ApplicationRecord
  validates :user_id, :uniqueness =>
    {
      :scope => :cheer_up_id,
      :message => "Users may only write one review per CheerUp."
    }
  belongs_to :cheer_up
  belongs_to :user
end
