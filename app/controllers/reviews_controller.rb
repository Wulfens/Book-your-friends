class ReviewsController < ApplicationController
  def new
    @animal = Animal.find(params[:animal_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @animal = AnimaL.find(params[:animal_id])
    @review.animal = @animal
    if @review.save
      redirect_to animal_path(@animal)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
