class User < ApplicationRecord
  has_one_attached :avatar

  # for comedian
  has_many :show_comedians, dependent: :destroy

  # for holder
  has_many :clubs

  # for all users
  has_many :bookings, dependent: :destroy
  has_many :shows, through: :bookings
  has_many :club_followings, dependent: :destroy
  has_many :comedian_followings, dependent: :destroy

  # validation
  validates :nickname, presence: true, uniqueness: true, length: { minimum: 2, maximum: 8, message: "长度为2~8个字符" }
end
