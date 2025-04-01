class Api::V1::Movie::TopMoviesController < ApplicationController
  def index
    top_movies = MovieGateway.get_top_movies
    render json: MovieSerializer.format_movies(top_movies)
  rescue StandardError => e
    render_error
  end
end
