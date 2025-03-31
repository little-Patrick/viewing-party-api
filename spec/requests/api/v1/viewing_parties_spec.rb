require 'rails_helper'

RSpec.describe "Api::V1::ViewingParties", type: :request do
  describe "POST /api/v1/viewing_parties" do
    it "creates a viewing party and returns http success" do
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

  describe "PATCH /api/v1/viewing_parties/:id" do
    it "adds a new user to an existing viewing party" do
      user1 = User.create!(name: "Test User 1", username: "test1", password: "password", api_key: "key1")
      user2 = User.create!(name: "Test User 2", username: "test2", password: "password", api_key: "key2")
      user3 = User.create!(name: "Test User 3", username: "test3", password: "password", api_key: "key3")

      viewing_party = ViewingParty.create!(
        name: "Sci-Fi Marathon",
        start_time: "2025-04-01 18:00:00",
        end_time: "2025-04-01 23:00:00",
        movie_id: 1,
        movie_title: "Interstellar",
        host_id: user1.id
      )

      viewing_party.invitations.create!(user: user1)
      viewing_party.invitations.create!(user: user2)

      expect(viewing_party.users.count).to eq(2)

      patch "/api/v1/viewing_parties/#{viewing_party.id}", 
        params: { "invitees_user_id": user3.id }, as: :json

      expect(response).to have_http_status(:success)
      
      json_response = JSON.parse(response.body)
      invitees = json_response["data"]["attributes"]["invitees"]

      expect(invitees.length).to eq(3)
    end

    it "returns an error if viewing party ID is invalid" do
      user3 = User.create!(name: "Test User 3", username: "test3", password: "password", api_key: "key3")

      patch "/api/v1/viewing_parties/999999", 
        params: { "invitees_user_id": user3.id }, as: :json

      expect(response).to have_http_status(:not_found)
      json_response = JSON.parse(response.body)

      expect(json_response["error"]).to eq("Viewing Party not found")
    end

    it "returns an error if the user ID is invalid" do
      user1 = User.create!(name: "Test User 1", username: "test1", password: "password", api_key: "key1")

      viewing_party = ViewingParty.create!(
        name: "Sci-Fi Marathon",
        start_time: "2025-04-01 18:00:00",
        end_time: "2025-04-01 23:00:00",
        movie_id: 1,
        movie_title: "Interstellar",
        host_id: user1.id
      )

      patch "/api/v1/viewing_parties/#{viewing_party.id}", 
        params: { "invitees_user_id": 999999 }, as: :json

      expect(response).to have_http_status(:unprocessable_entity)
      json_response = JSON.parse(response.body)

      expect(json_response["error"]).to eq("Invalid user ID")
    end
  end
end

