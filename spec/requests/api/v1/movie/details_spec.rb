require 'rails_helper'

RSpec.describe "Api::V1::Movie::Details", type: :request do
  describe "GET /show" do
    it "returns http success" do
      get "/api/v1/movie/details/278"

      expect(response).to have_http_status(:success)
    end
  end

end
