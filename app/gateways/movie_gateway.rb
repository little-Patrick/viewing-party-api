class MovieGateway
  def  self.get_top_movies
    response = conn.get("/3/movie/top_rated", { api_key: api_key })
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.search_movies(search)
    response = conn.get("/3/search/movie", { api_key: api_key, query: search })
    JSON.parse(response.body, symbolize_names: true)
  end


  def self.movie_details(id)
    response = conn.get("/3/movie/#{id}", { api_key: api_key })
    json = JSON.parse(response.body, symbolize_names: true)
    movie = Movie.new(json)

    get_reviews(id, movie)
    get_cast(id, movie)
    movie
  end

  private

  def self.get_reviews(id, movie)
    response = conn.get("/3/movie/#{id}/reviews", { api_key: api_key })
    json = JSON.parse(response.body, symbolize_names: true)

    movie.add_reviews(json)
  end

  def self.get_cast(id, movie)
    response = conn.get("/3/movie/#{id}/credits", { api_key: api_key })
    json = JSON.parse(response.body, symbolize_names: true)

    movie.add_cast(json)
  end

  def self.conn
    Faraday.new(url: "https://api.themoviedb.org") 
  end

  def self.api_key
    Rails.application.credentials.tmdb[:key]
  end
end
