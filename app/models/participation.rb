class Participation < ApplicationRecord
  belongs_to :user
  belongs_to :activity
  has_many :participant_reviews, dependent: :destroy
end
