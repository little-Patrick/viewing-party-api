class Api::V1::Movie::TopMoviesController < ApplicationController
  def index
    api_key = Rails.application.credentials.tmdb[:key]
    
    conn = Faraday.new(url: "https://api.themoviedb.org") 
    # do |faraday|
    #   faraday.headers["Authorization"] = "Bearer #{api_key}"
    # end

    response = conn.get("/3/movie/top_rated", { api_key: api_key })
    top_movies = JSON.parse(response.body, symbolize_names: true)
    
    render json: MovieSerializer.format_movies(top_movies)
  end
end
