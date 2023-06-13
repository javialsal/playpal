class AddPlaceToGames < ActiveRecord::Migration[7.0]
  def change
    add_column :games, :place, :string
  end
end
