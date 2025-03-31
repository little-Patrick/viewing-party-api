class Invitation < ApplicationRecord
  belongs_to :viewing_party
  belongs_to :user

  def self.invitee_lookup(invitees)
    User.where(id: invitees).pluck(:id, :name, :username)
  end
end
