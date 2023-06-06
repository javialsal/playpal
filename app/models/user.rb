class User < ApplicationRecord
  belongs_to :game_type
  has_many :games
  has_many :participations
  has_many :reviews

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
