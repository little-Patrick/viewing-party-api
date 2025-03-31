# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
User.destroy_all
Invitation.destroy_all
ViewingParty.destroy_all

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
