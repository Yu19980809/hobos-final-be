class ComedianFollowing < ApplicationRecord
  belongs_to :user
  belongs_to :comedian, class_name: 'User'
end
