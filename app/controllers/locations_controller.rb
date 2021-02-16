class LocationsController < ApplicationController

    def new
        @animal = Animal.find(params[:animal_id])
        @location = Location.new
    end

    def create
        @location = Location.new(location_params)
        @user = current_user
        @animal = Animal.find(params[:animal_id])
        @location.animal = @animal
        @location.user = @user
        @location.save!
        redirect_to animal_path(@animal)
      end

      def show
        @animal         = Animal.find(params[:id])
        @locations       = Location.where(animal_id: @animal.id)
        @locations_dates = @locations.map do |location|
          {
            from: location.start_date,
            to:   location.end_date
          }
        end
      end
    
      private
    
      def location_params
        params.require(:location).permit(:start_date, :end_date)
      end
   
end
