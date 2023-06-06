class DashboardsController < ApplicationController
  def home
    @games = current_user.participations.games


    # @monuments = current_user.monuments
    # @demands = Booking.all.select { |booking| booking.monument.user == current_user }
    # @future_bookings = @bookings.where(end_date: Date.today) + @bookings.where('start_date >= ?', Date.today)
    # @passed_bookings = @bookings.where('end_date < ?', Date.today)
  end
end
