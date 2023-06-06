class GameType < ApplicationRecord
  has_many :users
  has_many :games

  validates :name, presence: true
end
