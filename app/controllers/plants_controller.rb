class PlantsController < ApplicationController
  before_action :set_plant, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      @query = params[:query]
      @plants = plant.where("name LIKE ?","%#{params[:query]}%")
    else
      @plants = Plant.all
      @markers = @plants.geocoded.map do |plant|
        {
          lat: plant.latitude,
          lng: plant.longitude,
          infoWindow: render_to_string(partial: "info_window", locals: { plant: plant })
        }
      end
    end
  end

  def new
    @plant = Plant.new
  end

  def create
    @plant = Plant.new(plant_params)
    if @plant.save
      redirect_to plants_path
    else
      render :new
    end
  end

  def show
    @plant = Plant.find(params[:id])
  end

  def edit
  end

  def update
    @plant.update(plant_params)
    redirect_to plant_path(@plant)
  end

  def destroy
    @plant.destroy
    redirect_to plants_path
  end

  private

  def set_plant
    @plant = Plant.find(params[:id])
  end

  def plant_params
    params.require(:plant).permit(:name, :address, :category, :sun, :description, :price_per_day, :orientation, :photo)
  end

  private
  def plant_params
    params.require(:plant).permit(:photo)
  end
end
