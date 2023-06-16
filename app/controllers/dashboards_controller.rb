class DashboardsController < ApplicationController
  def home
    @next_games = current_user.mygames.where("start_at > ?", (Time.now + 7_200)).order("start_at")
  end

  def mygames
    @mygames = current_user.mygames.order("start_at")
  end
end
