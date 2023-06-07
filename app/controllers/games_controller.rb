class GamesController < ApplicationController
  before_action:set_game, only: [:show]

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

  private

  def set_game
    @game = Game.find(params[:id])
  end
end
