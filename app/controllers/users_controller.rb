class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])

    # @victories = @user.mygames.select { |game| game.winner == @user }
    @victories = @user.victories_number
    @number_of_games = @user.past_games_with_score.count
    @reviews = @user.participations.map(&:reviews)
    personality = @reviews.map { |review| review.pluck(:personality_rating) }
    personality_total = personality.map { |p| p.sum unless p.empty? }
    @personality_rating = personality_total.compact.sum
  end

  private

  def user_params
    params.require(:user).permit(:photo)
  end
end
