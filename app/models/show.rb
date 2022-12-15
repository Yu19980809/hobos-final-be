class Show < ApplicationRecord
  has_one_attached :poster

  belongs_to :club

  # for comedian
  has_many :show_comedians, dependent: :destroy

  # for all users
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings

  # validation
  validates :name, :description, :date, :start_time, :end_time, :address, presence: true
end
