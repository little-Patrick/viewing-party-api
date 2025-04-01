require "rails_helper"

RSpec.describe User, type: :model do
  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:username) }
    it { should validate_uniqueness_of(:username) }
    it { should validate_presence_of(:password) }
    it { should have_secure_password }
    it { should have_secure_token(:api_key) }

    it { should have_many :invitations }
    it { should have_many(:viewing_parties).through(:invitations) }
  end

  describe "instance methods" do
    before(:each) do
      @user = User.create!(
        name: "Leo DiCaprio",
        username: "leo_real_verified",
        password: "password",
        password_confirmation: "password"
      )
      @user2 = User.create!(
        name: "Tony Rice",
        username: "cold_onthe_shoulder",
        password: "password",
        password_confirmation: "password"
      )

      @hosted_party = ViewingParty.create!(
        name: "Titanic Watch Party",
        start_time: "2025-05-01 10:00:00",
        end_time: "2025-05-01 14:30:00",
        movie_id: 597,
        movie_title: "Titanic",
        host_id: @user.id
      )

      @invited_party = ViewingParty.create!(
        name: "LOTR Viewing Party",
        start_time: "2025-03-11 10:00:00",
        end_time: "2025-03-11 15:30:00",
        movie_id: 120,
        movie_title: "The Lord of the Rings: The Fellowship of the Ring",
        host_id: @user2.id
      )

      Invitation.create!(user: @user, viewing_party: @invited_party)
    end

    describe "instance methods" do
      it "#viewing_parties_hosted, returns hosted parties" do
        expect(@user.viewing_parties_hosted).to eq([@hosted_party])
      end

      it "#viewing_parties_invited, returns invited parties" do
        expect(@user.viewing_parties_invited).to eq([@invited_party])
      end
    end
  end
end
