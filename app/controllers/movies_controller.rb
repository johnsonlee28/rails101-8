class MoviesController < ApplicationController

  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      redirect_to movies_path, notice:"已发布新电影!"
    else
      render :new
    end
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    @movie.update(movie_params)
    redirect_to movie_path, notice: "已更新内容!"
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movie_path
  end

  def favorite
    @movie = Movie.find(params[:id])
    type = params[:type]
    if type == "favorite"
      current_user.favorite_movies << @movie
      redirect_to :back
    elsif type == "unfavorite"
      current_user.favorite_movies.delete(@movie)
      redirect_to :back
    else
      redirect_to :back
    end
  end
  
  private
  def movie_params
    params.require(:movie).permit(:title,:image,:description)
  end
end
