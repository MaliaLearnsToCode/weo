class CreatorReview < ApplicationRecord
  belongs_to :participant, class_name: "User", foreign_key: "participant_id"
  belongs_to :creator, class_name: "User", foreign_key: "creator_id"
end
