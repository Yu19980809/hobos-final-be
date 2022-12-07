class User < ApplicationRecord
  # for comedian
  has_many :show_comedians

  # for holder
  has_many :clubs

  # for all users
  has_many :bookings
  has_many :shows, through: :bookings
  has_many :club_followings
  has_many :comedian_followings
end
