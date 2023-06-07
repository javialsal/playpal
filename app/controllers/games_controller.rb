class GamesController < ApplicationController

  def index
    @mygames = current_user.games_as_participant
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end
end
