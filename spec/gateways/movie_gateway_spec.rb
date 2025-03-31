require "rails_helper"

RSpec.describe "Movie Gateway" do
  it "::get_top_movies should return an top movie data" do
    movie_response = MovieGateway.get_top_movies

    movie_response[:results].each do |movie|
      expect(movie).to have_key(:adult)
      expect(movie).to have_key(:genre_ids)
      expect(movie).to have_key(:id)
      expect(movie).to have_key(:original_title)
      expect(movie).to have_key(:overview)
      expect(movie).to have_key(:popularity)
      expect(movie).to have_key(:title)
      expect(movie).to have_key(:vote_average)
      expect(movie).to have_key(:vote_count)
    end
  end

  it "::search_movies should return searched movie data based off the param" do
    search_response = MovieGateway.search_movies("Lord of the rings")

    search_response[:results].each do |movie|
      expect(movie).to have_key(:adult)
      expect(movie).to have_key(:genre_ids)
      expect(movie).to have_key(:id)
      expect(movie).to have_key(:original_title)
      expect(movie).to have_key(:overview)
      expect(movie).to have_key(:popularity)
      expect(movie).to have_key(:vote_average)
      expect(movie).to have_key(:vote_count)
    end
  end

  it "::movie_details, returns details of movie" do
    movie = MovieGateway.movie_details(278)
    expect(movie.id).to_not be_nil
    expect(movie.title).to_not be_nil
    expect(movie.release_date).to_not be_nil
    expect(movie.vote_average).to_not be_nil
    expect(movie.runtime).to_not be_nil
    expect(movie.genres).to_not be_nil
    expect(movie.summary).to_not be_nil
    expect(movie.release_date).to_not be_nil
  end
end
