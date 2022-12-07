class Club < ApplicationRecord
  has_many :shows
  has_many :club_followings

  # for holder
  belongs_to :user
end
