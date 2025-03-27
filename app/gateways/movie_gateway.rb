class MovieGateway
  def  self.get_top_movies
    response = conn.get("/3/movie/top_rated", { api_key: api_key })
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.search_movies(search)
    response = conn.get("/3/search/movie", { api_key: api_key, query: search })
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def self.conn
    Faraday.new(url: "https://api.themoviedb.org") 
  end

  def self.api_key
    Rails.application.credentials.tmdb[:key]
  end
end
