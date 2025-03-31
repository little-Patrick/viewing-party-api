class ViewingPartySerializer
  def self.format_parties(party)
    {
      data: {
        id: party.id.to_s,
        type: "viewing_party",
        attributes: {
          name: party.name,
          start_time: party.start_time,
          end_time: party.end_time,
          movie_id: party.movie_id,
          movie_title: party.movie_title,
          invitees: format_invitees(party.users)
        }
      }
    }
  end

  def self.format_invitees(invitees)
    invitees.map do |invitee|
      {
        id: invitee.id,
        name: invitee.name,
        username: invitee.username
      }
    end
  end
end
