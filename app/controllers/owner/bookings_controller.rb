class Owner::BookingsController < ApplicationController
  before_action :set_booking, only: [:accept, :refuse]

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

  def refuse_booking
    @booking = Booking.find(params[:id])
    @booking.refuse
    @booking.save
    redirect_to owner_bookings_path
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
    @booking.accepted = "Pending"
    @booking.save ? (redirect_to bookings_path(@plant)) : (render :new)
    flash[:notice] = "You have successfully booked a plant"
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
