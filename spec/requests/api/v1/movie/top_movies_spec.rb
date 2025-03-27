require 'rails_helper'

RSpec.describe "Api::V1::Movie::TopMovies", type: :request do
  describe "GET /show" do
    it "returns http success" do
      get "/api/v1/movie/top_movies"
       
      expect(response).to have_http_status(:success)
      movies = JSON.parse(response.body, symbolize_names: true)
      expect(movies[:data].count).to be(20)

      movies[:data].each do |movie|
        expect(movie).to have_key(:id)
        expect(movie[:id]).to be_a(String)

        expect(movie).to have_key(:type)
        expect(movie[:type]).to eq("movie")

        expect(movie[:attributes][:title]).to be_a(String)

        expect(movie[:attributes][:vote_average]).to be_a(Float)
      end
    end
  end
end
