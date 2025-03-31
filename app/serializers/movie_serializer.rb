class MovieSerializer
  def self.format_movies(movies)
    { data:
      movies[:results].map do |movie|
          {
            id: movie[:id].to_s,
            type: "movie",
            attributes: {
              title: movie[:title],
              vote_average: movie[:vote_average]
            }
          }
      end.first(20)
    }
  end
end
