class Chatroom < ApplicationRecord
  scope :private_chats, -> { where.not(id: Activity.pluck(:chatroom_id)) }

  belongs_to :activity
  has_many :messages, dependent: :destroy
  has_many :users, through: :messages
  has_one :itinerary, through: :activities

  validates :users, uniqueness: { scope: :chatroom, message: "is already in the chatroom" }
  validate :max_two_participants, if: :chatroom_is_private?

  # def max_two_participants
  #   # chatroom.user_chatrooms.select(&:persisted?).size >= 2
  #   errors.add(:chatroom, "This is a private chatroom. No more than 2 chatters!") if chatroom.user_chatrooms.pluck(:id).size > 2
  # end

  # def private?
  #   !activity_room?
  # end

  # def activity_room?
  #   activity.present?
  # end

  # def private_chat_uniqueness
  #   additional_user = chatroom.users.where.not(id: user_id).take
  #   existing_private_chatroom_ids = user.chatrooms.private_chats.pluck(:id)
  #   existing_user_chatroom = UserChatroom.where.not(chatroom_id: chatroom.id).where(chatroom_id: existing_private_chatroom_ids, user: other_user)

  #   errors.add(:chatroom, "for these two users already exists") if existing_user_chatroom.present?
  # end

end
