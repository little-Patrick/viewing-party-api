require 'rails_helper'

RSpec.describe "Api::V1::Movie::Details", type: :request do
  describe "GET /show" do
    it "returns http success", :vcr do
      VCR.use_cassette("movie_details") do
   
        get "/api/v1/movie/details/278"

        expect(response).to have_http_status(:success)
        movies = JSON.parse(response.body, symbolize_names: true)[:data]

        expect(movies).to have_key(:id)
        expect(movies[:type]).to eq("movie")
        expect(movies[:attributes]).to have_key(:title)
        expect(movies[:attributes]).to have_key(:release_year)
        expect(movies[:attributes]).to have_key(:vote_average)
        expect(movies[:attributes]).to have_key(:runtime)
        expect(movies[:attributes]).to have_key(:genres)
        expect(movies[:attributes]).to have_key(:summary)
        expect(movies[:attributes]).to have_key(:cast)
        expect(movies[:attributes]).to have_key(:total_reviews)
        expect(movies[:attributes]).to have_key(:reviews)
      end
    end
    it "returns http failure" do
      VCR.turned_off do
        WebMock.allow_net_connect!
        get "/api/v1/movie/details/79877676778"

        expect(response).to have_http_status(400)
      end
    end
  end
end
