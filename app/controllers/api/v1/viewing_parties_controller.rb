class Api::V1::ViewingPartiesController < ApplicationController
  def create
    invitees = params[:invitees] || []
    
    party = ViewingParty.create!(viewing_party_params)
    
    invitees.each do |user_id|
      party.invitations.create(user_id: user_id)
    end
    
    render json: ViewingPartySerializer.format_parties(party), status: :created
  end
  
  def update
    party = ViewingParty.find_by(id: params[:id])
    return render json: { error: "Viewing Party not found" }, status: :not_found unless party

    invitee_id = params[:invitees_user_id]
    return render json: { error: "Invalid user ID" }, status: :unprocessable_entity unless User.exists?(invitee_id)

    party.invitations.create!(user_id: invitee_id)

    render json: ViewingPartySerializer.format_parties(party), status: :ok
  end

  private
  
  def viewing_party_params
    params.permit(:name, :start_time, :end_time, :movie_id, :movie_title, :host_id)
  end
end
