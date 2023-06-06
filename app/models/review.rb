class Review < ApplicationRecord
  belongs_to :participation
  belongs_to :user

  validates :personality_rating, presence: true, inclusion: [true, false], exclusion: [nil]
end
