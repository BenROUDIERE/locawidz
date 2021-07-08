class PlantsController < ApplicationController
  def index
  end

  def show
    @plant = Plant.find(params[:id])
  end

  def new
  end

  def create
  end

  private
  def plant_params
    params.require(:plant).permit(:photo)
  end
end
