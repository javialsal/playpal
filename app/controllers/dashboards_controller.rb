class DashboardsController < ApplicationController
  def home
    @next_games = []
    current_user.participations.each do |participation|
      @next_games << participation.game if participation.game.start_at > DateTime.now
    end
  end

  def mygames
    @mygames = current_user.mygames
  end
end
