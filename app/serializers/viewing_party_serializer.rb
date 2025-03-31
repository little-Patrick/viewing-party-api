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

{
  "data": {
    "id": "1",
    "type": "viewing_party",
    "attributes": {
      "name": "Juliet's Bday Movie Bash!",
      "start_time": "2025-02-01 10:00:00",
      "end_time": "2025-02-01 14:30:00",
      "movie_id": 278,
      "movie_title": "The Shawshank Redemption",
      "invitees": [
        {
          "id": 11,
          "name": "Barbara",
          "username": "leo_fan"
        },
                {
          "id": 7,
          "name": "Ceci",
          "username": "titanic_forever"
        },
                {
          "id": 5,
          "name": "Peyton",
          "username": "star_wars_geek_8"
        }
      ]
    }
  }
}
