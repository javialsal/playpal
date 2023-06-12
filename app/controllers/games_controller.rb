class GamesController < ApplicationController
  before_action :set_game, only: [:show]

  def index
    if params[:query].present?
      @games = current_user.games_not_participating_and_to_come.order("start_at").where("location ILIKE ?", "%#{params[:query]}%")
    else
      @games = current_user.games_not_participating_and_to_come.order("start_at")
    end
    respond_to do |format|
      format.html
      format.text { render partial: "games/list", locals: {games: @games}, formats: [:html] }
    end
  end

  def show
    @chatroom = @game.chatroom
    @message = Message.new
    @participation = Participation.new
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

end
