class VeiwingPartySerializer
  def self.format_partys(partys)
    { data:
      partys[:results].map do |party|
          {
            id: party[:id].to_s,
            type: "viewing_party",
            attributes: {
              name: party[:name],
              start_time: party[:startTime],
              end_time: party[:endTime],
              movie_id: party[movieId],
              movie_title: party[movieTitle],
              invitees: format_invitees(Invitation.invitee_lookup(party[:invitees]))
            }
          }
      end
    }
  end

  def format_invitees(invitees)
    invitees.map do |invitee|
      {
        id: invitee[:id],
        name: invitee[:name],
        username: invitee[:username]
      }
    end
  end
end
