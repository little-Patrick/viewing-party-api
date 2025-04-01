class Api::V1::Movie::DetailsController < ApplicationController
  def show
    movie = MovieGateway.movie_details(params[:id])
    if movie.nil?
      return render_error
    end
    render json: MovieSerializer.format_movie_details(movie)
  rescue StandardError => e
    render_error
  end
end
