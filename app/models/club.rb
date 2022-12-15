class Club < ApplicationRecord
  has_many :shows, dependent: :destroy
  has_many :club_followings, dependent: :destroy

  # for holder
  belongs_to :user

  # validation
  validates :name, presence: true, uniqueness: true
  validates :address, :description, presence: true
end
