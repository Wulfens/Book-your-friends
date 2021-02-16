class AnimalsController < ApplicationController
  def index
    @animals = Animal.new
  end

  def show
    @animal = Animal.find(params[:id])
  end

  def new
    @animal = Animal.new
  end

  private

  def animal_params
    params.require(:animal).permit(:name, :species, :price_per_hour)
  end
end
