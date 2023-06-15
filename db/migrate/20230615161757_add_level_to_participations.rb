class AddLevelToParticipations < ActiveRecord::Migration[7.0]
  def change
    add_column :participations, :level, :integer
  end
end
