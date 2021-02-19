class AnimalsController < ApplicationController
  def index
    if params[:query].present?
      sql_query = "name ILIKE :query OR species ILIKE :query"
      @animals = Animal.where(sql_query, query: "%#{params[:query]}%")
    else
      @animals = Animal.all
      @top_animals = Animal.all.sort_by { |animal| - animal.average_rating }.first(5)
    end
  end

  def show
    @animal = Animal.find(params[:id])
    @location = Location.new
    @location.animal = @animal
    @reviews = @animal.reviews
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

  def destroy
    @animal = Animal.find(params[:id])
    @animal.destroy
    redirect_to animals_path
  end

  private

  def animal_params
    params.require(:animal).permit(:name, :species, :price_per_hour, :photo, :description)
  end
end
