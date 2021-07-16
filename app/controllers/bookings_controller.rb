class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show edit update destroy]

  def index
    @bookings = Booking.all
  end

  def show
    @plant = Plant.new
  end

  def new
    @booking = Booking.new
    @plant = Plant.find(params[:plant_id])
  end

  def edit
  end

  def create
    @booking = Booking.new(booking_params)
    @plant = Plant.find(params[:plant_id])
    @booking.plant = @plant
    @booking.user = current_user
    @booking.status = "pending"

    if @booking.save
      redirect_to plants_index_path, notice: "booking was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @booking.update(booking_params)
      redirect_to @booking, notice: "booking was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @booking.destroy
    redirect_to bookings_url, notice: "booking was successfully destroyed."
  end

  private

  def set_booking
    @plant = Plant.find(params[:id])
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end

    
