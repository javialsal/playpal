class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])

    @victories = @user.mygames.select { |game| game.winner == @user }
  end

  private

  def user_params
    params.require(:user).permit(:photo)
  end
end
