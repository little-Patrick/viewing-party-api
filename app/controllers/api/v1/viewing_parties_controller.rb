class Api::V1::ViewingPartiesController < ApplicationController
  def create
    invitees = params[:invitees] || []
    
    viewing_party_attributes = params.permit(:name, :start_time, :end_time, :movie_id, :movie_title, :host_id)
    party = ViewingParty.create!(viewing_party_attributes)
    
    invitees.each do |user_id|
      party.invitations.create(user_id: user_id)
    end
    
    render json: ViewingPartySerializer.format_parties(party), status: :created
  end
  
  private
  
  def viewing_party_params
    params.permit(:name, :start_time, :end_time, :movie_id, :movie_title, :host_id)
  end
end
