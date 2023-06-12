class ParticipationsController < ApplicationController

  def create
  @participation = Participation.new
  @game = Game.find(params[:game_id])
  @participation.game = @game
  @participation.user = current_user
  @participation.score = 0
  @participation.status = 0
  if @participation.save
    redirect_to game_path(@game)
  else
    render :new, status: :unprocessable_entity
  end

  end
end
