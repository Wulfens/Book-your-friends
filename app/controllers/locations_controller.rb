class LocationsController < ApplicationController

    def new
        @animal = Animal.find(params[:animal_id])
        @location = Location.new
    end

    def create
        @location = location.new(location_params)
        @animal = Animal.find(params[:animal_id])
        @location.animal = @animal
        @location.save
        redirect_to animal_path(@animal)
      end
    
      private
    
      def location_params
        params.require(:location).permit(:start_date, :end_date)
      end
   
end
