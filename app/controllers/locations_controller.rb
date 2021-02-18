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
        @location.save
        redirect_to animal_path(@animal)
      end

      def show
        @location = Location.find(params[:id])
      end

      def accept
        @location = Location.find(params[:id])
        @location.update(status: "Accepted")
        redirect_to dashboard_path
      end

      def decline
        @location = Location.find(params[:id])
        @location.update(status: "Declined")
        redirect_to dashboard_path
      end

      private
    
      def location_params
        params.require(:location).permit(:start_date, :end_date, :status)
      end
   
end
