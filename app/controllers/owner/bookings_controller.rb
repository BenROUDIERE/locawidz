class Owner::BookingsController < ApplicationController
  before_action :set_booking, only: [:accept, :refuse]

  def index
    @bookings = current_user.bookings.order(created_at: :desc)
    @booked = Booking.joins(:plant).where(plants: {user: current_user}).order(created_at: :desc)
  end

  def new
    @plant = Plant.find(params[:plant_id])
    @booking = Booking.new(plant_id:@plant.id)
  end

  def create
    @booking = Booking.new(booking_params)
    @plant = Plant.find(params[:plant_id])
    @booking.user = current_user
    @booking.plant = @plant
    @booking.accepted = "pending"
    @booking.save ? (redirect_to bookings_path(@plant)) : (render :new)
    flash[:notice] = "You have successfully booked a plant"
  end

  def status
    @booking.accept
    save_booking
  end

  def refuse
    @booking.refuse
    save_booking
  end

  private
  def set_booking
    @plant = Plant.find(params[:id])
    @booking = Booking.find(params[:id])
  end

  def save_booking
    @booking.save ? (redirect_to bookings_path) : (render :new)
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :id, :status)
  end
end
