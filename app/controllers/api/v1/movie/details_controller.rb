class Api::V1::Movie::DetailsController < ApplicationController
  def show
    movie = MovieGateway.movie_details(params[:id])
    render json: MovieSerializer.format_movie_details(movie)
  end
end
