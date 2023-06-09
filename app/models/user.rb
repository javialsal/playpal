class User < ApplicationRecord
  belongs_to :game_type
  has_many :games, dependent: :destroy
  has_many :participations, dependent: :destroy
  has_many :games_as_participant, through: :participations, source: :game
  has_many :reviews, dependent: :destroy
  has_many :messages
  has_one_attached :photo
  before_save :attach_photo

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # LINES COMMENTED BECAUSE NOT ASKED IN THE SIGNUP PAGE
  # validates :username, presence: true, uniqueness: true
  # validates :first_name, presence: true
  # validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true

  def attach_photo
    return if photo.attached?

    self.photo.attach(io: File.open(File.join(Rails.root, 'app/assets/images/default_avatar.jpg')), filename: 'avatar')
  end

  def mygames
    self.games_as_participant
  end

  def games_not_participating_and_to_come
    Game.not_participating_games_to_come_for(self)
  end
end
