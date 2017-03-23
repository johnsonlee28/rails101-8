class ReviewsController < ApplicationController
  before_action :authenticate_user!, only:[:create,:destroy]

  def create
    @movie = Movie.find(params[:movie_id])
    @review = @movie.reviews.build(review_params)
    @review.user = current_user

    if @review.save
      redirect_to movie_path(@movie)
    else
      redirect_to movie_path(@movie)
    end
  end

  def destroy
    @movie = Movie.find(params[:movie_id])
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to movie_path(@movie)
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end


end
