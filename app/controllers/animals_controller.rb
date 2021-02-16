class AnimalsController < ApplicationController
  def index
    @animals = Animal.all
  end

  def show
    @animal = Animal.find(params[:id])
    @location = Location.new
  end

  def new
    @animal = Animal.new
  end

  def create
    @animal = Animal.new(animal_params)
    @animal.user = current_user
    if @animal.save
      redirect_to animal_path(@animal), notice: "Congrats ! You add A New Best Friend"
    else
      render :new
    end
  end

  private

  def animal_params
    params.require(:animal).permit(:name, :species, :price_per_hour)
  end
end
