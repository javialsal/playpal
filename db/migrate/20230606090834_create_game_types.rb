class CreateGameTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :game_types do |t|
      t.string :name
      t.text :rules

      t.timestamps
    end
  end
end
