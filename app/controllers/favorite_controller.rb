class FavoriteController < ApplicationController

  def index
    @jobs = current_user.favorite_movies
  end
end
