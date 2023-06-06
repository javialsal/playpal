class DashboardsController < ApplicationController
  def home
    @next_games = []
    current_user.participations.each do |participation|
      if participation.game.start_at > DateTime.now
        @next_games << participation.game
      end
    end
  end
end
