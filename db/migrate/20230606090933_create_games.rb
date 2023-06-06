class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.string :location
      t.integer :duration
      t.datetime :start_at
      t.integer :number_of_players
      t.boolean :competitive
      t.text :description
      t.integer :status
      t.references :user, null: false, foreign_key: true
      t.references :game_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
