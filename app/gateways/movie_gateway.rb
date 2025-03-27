class MovieGateway
  def  self.get_top_movies
    conn.get("/3/movie/top_rated", { api_key: api_key })
  end

  private

  def self.conn
    Faraday.new(url: "https://api.themoviedb.org") 
  end

  def self.api_key
    Rails.application.credentials.tmdb[:key]
  end
end
