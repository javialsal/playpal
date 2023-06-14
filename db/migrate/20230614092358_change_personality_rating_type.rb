class ChangePersonalityRatingType < ActiveRecord::Migration[7.0]
  def change
    change_column :reviews, :personality_rating, :integer, using: 'personality_rating::integer'
  end
end
