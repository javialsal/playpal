class Participation < ApplicationRecord
  belongs_to :game
  belongs_to :user
  has_many :reviews, dependent: :destroy

  validates :status, presence: true
  # validates :score, presence: true, numericality: { only_integer: true }
  validates :user, uniqueness: { scope: :game }

  after_save :set_levels

  def compute_level
    base = score.positive? ? score : (score * -1)
    score_points = ((base / 100).fdiv(12) * 10).round
    score_points = score_points * -1 if score.negative?

    position_points = if game.participations.order(:score).first == self
                        3
                      elsif game.participations.order(:score).second == self
                        2
                      elsif game.participations.order(:score).third == self
                        1
                      else
                        0
                      end

    score_points + position_points
  end

  private

  def set_levels
    return unless score_previously_changed?
    return unless game.participations.all? { |p| !p.score.nil? }

    game.participations.each do |p|
      p.update(level: p.compute_level)
    end
  end
end
