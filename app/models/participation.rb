class Participation < ApplicationRecord
  belongs_to :game
  belongs_to :user
  has_many :reviews

  validates :status, presence: true
  validates :score, presence: true, numericality: { only_integer: true }
end
