class ReviewsController < ApplicationController

  def new
    @location = Location.find(params[:location_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @location = Location.find(params[:location_id])
    @review.location = @location
    if @review.save
      redirect_to animal_path(@location.animal)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
