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
        redirect_to dashboard_path if @location.save
      end

      def show
        @location = Location.find(params[:id])
      end

      def accept
        @location = Location.find(params[:id])
        # @location.update(status: "Accepted")
        @location.status = "Accepted"
        redirect_to dashboard_path if @location.save
      end

      def decline
        @location = Location.find(params[:id])
        # @location.update(status: "Declined")
        @location.status = "Declined"
        redirect_to dashboard_path if @location.save
      end

      private
    
      def location_params
        params.require(:location).permit(:start_date, :end_date)
      end
   
end
