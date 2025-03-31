require "rails_helper"

RSpec.describe "Movie" do
  before(:each) do
    @data = {
      adult: false,
      backdrop_path: "/zfbjgQE1uSd9wiPTX4VzsLi0rGG.jpg",
      belongs_to_collection: nil,
      budget: 25000000,
      genres: [
        { id: 18, name: "Drama" },
        { id: 80, name: "Crime" }
      ],
      homepage: "",
      id: 278,
      imdb_id: "tt0111161",
      origin_country: ["US"],
      original_language: "en",
      original_title: "The Shawshank Redemption",
      overview: "Imprisoned in the 1940s for the double murder of his wife and her lover...",
      popularity: 36.201,
      poster_path: "/9cqNxx0GxF0bflZmeSMuL5tnGzr.jpg",
      production_companies: [
        { id: 97, logo_path: "/7znWcbDd4PcJzJUlJxYqAlPPykp.png", name: "Castle Rock Entertainment", origin_country: "US" }
      ],
      production_countries: [{ iso_3166_1: "US", name: "United States of America" }],
      release_date: "1994-09-23",
      revenue: 28341469,
      runtime: 142,
      spoken_languages: [{ english_name: "English", iso_639_1: "en", name: "English" }],
      status: "Released",
      tagline: "Fear can hold you prisoner. Hope can set you free.",
      title: "The Shawshank Redemption",
      video: false,
      vote_average: 8.708,
      vote_count: 28014
    }

    @movie = Movie.new(@data)
  end
  describe "initialize" do
    it "initializes" do
      expect(@movie).to be_an_instance_of Movie
    end
    it "has correct instance variables" do
      expect(@movie.id).to eq(278)
      expect(@movie.title).to eq("The Shawshank Redemption")
      expect(@movie.release_date).to eq("1994-09-23")
      expect(@movie.vote_average).to eq(8.708)
      expect(@movie.runtime).to eq(142)
      expect(@movie.genres).to eq([{:id=>18, :name=>"Drama"}, {:id=>80, :name=>"Crime"}])
      expect(@movie.summary).to eq("Imprisoned in the 1940s for the double murder of his wife and her lover...")
      expect(@movie.reviews).to eq(nil)
      expect(@movie.total_reviews).to eq(nil)
      expect(@movie.cast).to eq(nil)
    end
  end

  describe "instance methods" do
    it "#add_reviews, it can add review to object" do
      @movie.add_reviews(@data)

      expect(@movie.reviews).to eq(nil)
      expect(@movie.total_reviews).to eq(nil)
    end
    it "#add_cast, it can add cast to object" do
      @movie.add_cast(@data)

      expect(@movie.cast).to eq(nil)
    end
  end
end
