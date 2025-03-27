require "rails_helper"

RSpec.describe "Movie Gateway" do
  it "should return an top movie data" do
    movie_response = MovieGateway.get_top_movies
    {
      "adult": false,
      "genre_ids": [
        18,
        80
        ],
      "id": 278,
      "original_title": "The Shawshank Redemption",
      "overview": "Imprisoned in the 1940s for the double murder of his wife and her lover, upstanding banker Andy Dufresne begins a new life at the Shawshank prison, where he puts his accounting skills to work for an amoral warden. During his long stretch in prison, Dufresne comes to be admired by the other inmates -- including an older prisoner named Red -- for his integrity and unquenchable sense of hope.",
      "popularity": 28.6761,
      "title": "The Shawshank Redemption",
      "vote_average": 8.7,
      "vote_count": 27967
    }


    movie_response["results"].each do |movie|
      expect(movie).to have_key("adult")
      expect(movie).to have_key("genre_ids")
      expect(movie).to have_key("id")
      expect(movie).to have_key("original_title")
      expect(movie).to have_key("overview")
      expect(movie).to have_key("popularity")
      expect(movie).to have_key("title")
      expect(movie).to have_key("vote_average")
      expect(movie).to have_key("vote_count")
    end

  end
end
