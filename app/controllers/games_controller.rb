class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit_score, :update_score]

  def index
    @games = current_user.games_not_participating_and_to_come
    @games = @games.near(params[:query], 5) if params[:query].present?
    @games = @games.where(game_type: params[:game_type]) if params[:game_type].present?
    @games = @games.where(game_type: params[:number_of_players]) if params[:number_of_players].present?
    @games = @games.where(game_type: params[:competitive]) if params[:competitive].present?
    @games = @games.select { |game| game.number_of_players > game.participations.count }


    respond_to do |format|
      format.html
      format.text { render partial: "games/list", locals: { games: @games }, formats: [:html] }
    end
  end

  def show
    @message = Message.new
    @participation = Participation.new
    @chatroom = @game.chatroom
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    @game.user = current_user
    @game.status = 0
    if @game.save
      redirect_to game_path(@game)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def edit_score
  end

  def update_score
    if @game.update(game_score_params)
      redirect_to game_path(@game)
    else
      render :edit_score, status: :unprocessable_entity
    end
  end

  private

  def set_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(
      :location,
      :start_at,
      :duration,
      :number_of_players,
      :competitive,
      :description,
      :game_type_id,
      :status
    )
  end

  def game_score_params
    params.require(:game).permit(participations_attributes: [:id, :score])
  end
end
