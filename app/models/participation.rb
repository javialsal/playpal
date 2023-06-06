class Participation < ApplicationRecord
  belongs_to :game
  belongs_to :user
  has_many :reviews
end
