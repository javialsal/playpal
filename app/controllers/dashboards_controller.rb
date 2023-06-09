class DashboardsController < ApplicationController
  def home
    @next_games = current_user.mygames.where("DATE(start_at) > ?", Date.today).order("start_at")
  end

  def mygames
    @mygames = current_user.mygames.order("start_at")
  end
end
