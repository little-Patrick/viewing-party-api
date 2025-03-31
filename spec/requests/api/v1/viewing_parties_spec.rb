require 'rails_helper'

RSpec.describe "Api::V1::ViewingParties", type: :request do
  describe "POST viewing_party" do
    it "returns http success" do
      user1 = User.create!(name: "Test User 1", username: "test1", password: "password", api_key: "key1")
      user2 = User.create!(name: "Test User 2", username: "test2", password: "password", api_key: "key2")
      
      body = {
        "name": "Sci-Fi Marathon", 
        "start_time": "2025-04-01 18:00:00", 
        "end_time": "2025-04-01 23:00:00", 
        "movie_id": 1, 
        "movie_title": "Interstellar",
        "host_id": user1.id,
        "invitees": [user1.id, user2.id]
      }
      
      post "/api/v1/viewing_parties", params: body, as: :json
      
      expect(response).to have_http_status(:success)
      json_response = JSON.parse(response.body)

      expect(json_response["data"]["attributes"]["name"]).to eq("Sci-Fi Marathon")
      expect(json_response["data"]["attributes"]["movie_title"]).to eq("Interstellar")
      
      viewing_party = ViewingParty.last
      expect(viewing_party.users.count).to eq(2)
    end
  end
end
