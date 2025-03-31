class Api::V1::ViewingPartiesController < ApplicationController
  def create
    party = Item.create!(viewing_party_params)
    render json: ViewingPartySerializer.new(party), status: :created
  end

  private

  def viewing_party_params
    params.permit(:name, :start_time, :end_time, :movie_id, :movie_title, :host_id)
  end
end
