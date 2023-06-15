class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])

    # @victories = @user.mygames.select { |game| game.winner == @user }
    @victories = @user.victories_number
    @number_of_games = @user.past_games_with_score.count
  end

  private

  def user_params
    params.require(:user).permit(:photo)
  end
end
