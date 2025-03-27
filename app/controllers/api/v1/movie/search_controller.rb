class Api::V1::Movie::SearchController < ApplicationController
  def index
    searched_movies = MovieGateway.search_movies(params[:movie])
    
    render json: MovieSerializer.format_movies(searched_movies)
  end
end
