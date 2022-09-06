class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :messages, dependent: :destroy
  has_many :chatrooms, through: :messages, dependent: :destroy
  has_many :itineraries, dependent: :destroy
  has_many :activities, through: :itineraries, dependent: :destroy
  has_many :interests, dependent: :destroy
  has_many :participations, dependent: :destroy

  has_many_attached :photos

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :age, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :gender, presence: true

  def activity_where(status)
    Activity.joins(:participations)
            .where('participations.user': self)
            .where('participations.status': status)
  end
end
