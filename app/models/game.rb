class Game < ApplicationRecord
  belongs_to :user
  belongs_to :game_type
  has_many :participations, dependent: :destroy
  has_many :users, through: :participations
  has_one :chatroom, dependent: :destroy

  validates :location, presence: true
  validates :start_at, presence: true
  validates :duration, presence: true, numericality: { only_integer: true }, comparison: { greater_than: 0 }
  validates :number_of_players, presence: true, numericality: { only_integer: true }, comparison: { greater_than: 0, less_than_or_equal_to: 5 }
  # validates :competitive, presence: true

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  after_create :create_participation_for_owner
  after_create :create_chatroom

  scope :not_participating_games_to_come_for, ->(user) {
    where.not(id: user.games_as_participant.pluck(:id))
    .where("start_at > ?", DateTime.now)
    .order(:start_at)
  }

  def winner
    self.participations.max_by { |participation| participation.score }.user
  end

  def create_participation_for_owner
    Participation.create(game: self, user: self.user, status: 1, score: 0)
  end

  def create_chatroom
    Chatroom.create(game_id: id)
  end

  def city
    location.split(',').last.strip.split(' ').last
  end
end
