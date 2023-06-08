class GamesController < ApplicationController
  before_action :set_game, only: [:show]

  def index
    @games = current_user.games_not_participating_and_to_come
    # @games = Game.not_participating_games_to_come_for(current_user)
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

  private

  def set_game
    @game = Game.find(params[:id])
  end
end
