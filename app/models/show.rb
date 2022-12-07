class Show < ApplicationRecord
  has_one_attached :poster

  belongs_to :club

  # for comedian
  has_many :show_comedians

  # for all users
  has_many :bookings
  has_many :users, through: :bookings
end
