class User < ApplicationRecord
  belongs_to :game_type
  has_many :games
  has_many :participations, dependent: :destroy
  has_many :games_as_participant, through: :participations, source: :game
  has_many :reviews, dependent: :destroy
  has_one_attached :photo

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
end
