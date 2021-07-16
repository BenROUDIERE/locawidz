class Owner::BookingsController < ApplicationController
  
  def index
    @bookings = current_user.bookings.order(created_at: :desc)
    @booked = Booking.joins(:plant).where(plants: {user: current_user}).order(created_at: :desc)
  end

  def accept_booking
    @booking = Booking.find(params[:id])
    @booking.accept
    @booking.save
    redirect_to owner_bookings_path
  end
end
