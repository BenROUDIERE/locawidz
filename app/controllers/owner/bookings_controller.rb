class Owner::BookingsController < ApplicationController
  
  def index
    @bookings = current_user.bookings.order(created_at: :desc)
    @booked = Booking.joins(:plant).where(plants: {user: current_user}).order(created_at: :desc)
  end
end
