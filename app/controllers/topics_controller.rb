class TopicsController < ApplicationController

  def index
    @movie = Movie.find(params[:movie_id])
    @topics = @movie.topics
  end

  def new
    @movie = Movie.find(params[:movie_id])
    @topic = @movie.topics.new
  end

  def create
    @movie = Movie.find(params[:movie_id])
    @topic = @movie.topics.new(topic_params)
    @topic.movie = @movie
    @topic.user = current_user

    if @topic.save
      redirect_to movie_topics_path(@movie)
    else
      render :new
    end
  end

  def edit
    @movie = Movie.find(params[:movie_id])
    @topic = @movie.topics.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:movie_id])
    @topic = @movie.topics.find(params[:id])

    if @topic.update(topic_params)
      redirect_to movie_path(@movie)
    else
      render :edit
    end
  end

  def destroy
    @movie = Movie.find(params[:movie_id])
    @topic = @movie.topics.find(params[:id])
    if @topic.destroy
      redirect_to movie_topics_path
    end
  end

  private

  def topic_params
    params.require(:topic).permit(:title,:content)
  end


end
