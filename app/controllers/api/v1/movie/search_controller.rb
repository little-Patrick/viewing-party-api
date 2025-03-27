class Api::V1::Movie::SearchController < ApplicationController
  def show
    search = params[:movie]

    api_key = Rails.application.credentials.tmdb[:key]
    
    conn = Faraday.new(url: "https://api.themoviedb.org") 

    response = conn.get("/3/search/movie", { api_key: api_key, query: search })
    top_movies = JSON.parse(response.body, symbolize_names: true)
    
    render json: MovieSerializer.format_movies(top_movies)
  end
end
