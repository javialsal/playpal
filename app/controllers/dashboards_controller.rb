class DashboardsController < ApplicationController
  def home
    # array = []
    # @next_games = current_user.participations.games.each do |game|
    #   if game.start_at > Date.now
    #     array << game
    #   end

    @user_games = Game.all.select { |game| game.participation.user == current_user }
    @next_games = 
    end


    # @monuments = current_user.monuments
    # @demands = Booking.all.select { |booking| booking.monument.user == current_user }
    # @future_bookings = @bookings.where(end_date: Date.today) + @bookings.where('start_date >= ?', Date.today)
    # @passed_bookings = @bookings.where('end_date < ?', Date.today)
  end
end
