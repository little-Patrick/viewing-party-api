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

  def self.format_movie_details(movie)
    {
      data: {
        id: movie.id.to_s,
        type: "movie",
        attributes: {
          title: movie.title,
          release_year: movie.release_date.split("-").first.to_i, # Extract year from release_date
          vote_average: movie.vote_average,
          runtime: format_runtime(movie.runtime),
          genres: movie.genres.map { |genre| genre[:name] },
          summary: movie.summary,
          cast: movie.cast.first(10).map do |member|
            {
              character: member[:character],
              actor: member[:name]
            }
          end,
          total_reviews: movie.reviews.size,
          reviews: movie.reviews.first(5).map do |review|
            {
              author: review[:author],
              review: review[:content]
            }
          end
        }
      }
    }
  end

  private

  def self.format_runtime(minutes)
    hours = minutes / 60
    mins = minutes % 60
    "#{hours} hours, #{mins} minutes"
  end
end
