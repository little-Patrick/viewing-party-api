require 'rails_helper'

RSpec.describe Invitation, type: :model do
  before(:each) do
    @user1 = User.create!(name: "Danny DeVito", username: "danny_de_v", password: "jerseyMikesRox7")
    @user2 = User.create!(name: "Dolly Parton", username: "dollyP", password: "Jolene123")
    @user3 = User.create!(name: "Lionel Messi", username: "futbol_geek", password: "test123")
    @user4 = User.create!(name: "Billy Strings", username: "billy_s", password: "dog456")
    @user5 = User.create!(name: "Sam Bush", username: "stringray", password: "password123")

    @party1 = ViewingParty.create!(name: "Sci-Fi Marathon", start_time: "2025-04-01 18:00:00", end_time: "2025-04-01 23:00:00", movie_id: 1, movie_title: "Interstellar", host_id: @user1.id)
    @party2 = ViewingParty.create!(name: "Comedy Night", start_time: "2025-04-02 20:00:00", end_time: "2025-04-02 23:30:00", movie_id: 2, movie_title: "Superbad", host_id: @user2.id)
    @party3 = ViewingParty.create!(name: "Horror Fest", start_time: "2025-04-03 21:00:00", end_time: "2025-04-03 23:45:00", movie_id: 3, movie_title: "The Conjuring", host_id: @user3.id)
    @party4 = ViewingParty.create!(name: "Action Packed", start_time: "2025-04-04 19:00:00", end_time: "2025-04-04 22:00:00", movie_id: 4, movie_title: "Mad Max: Fury Road", host_id: @user4.id)
    @party5 = ViewingParty.create!(name: "Classic Movie Night", start_time: "2025-04-05 18:30:00", end_time: "2025-04-05 22:30:00", movie_id: 5, movie_title: "The Godfather", host_id: @user5.id)

    @invite1 = Invitation.create!(viewing_party: @party1, user: @user2)
    @invite2 = Invitation.create!(viewing_party: @party1, user: @user3)
    @invite3 = Invitation.create!(viewing_party: @party2, user: @user1)
    @invite4 = Invitation.create!(viewing_party: @party3, user: @user4)
    @invite5 = Invitation.create!(viewing_party: @party4, user: @user5)
  end 

  describe "relationships" do
    it { should belong_to :viewing_party }
    it { should belong_to :user }
  end

  describe "class methods" do
    it "::invitee_lookup, returns invitee information" do
      result = [[@user1.id, "Danny DeVito", "danny_de_v"], [@user3.id, "Lionel Messi", "futbol_geek"]]

      expect(Invitation.invitee_lookup([@user1.id, @user3.id])).to eq(result)
    end
  end
end
