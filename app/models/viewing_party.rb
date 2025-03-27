class ViewingParty < ApplicationRecord
  has_many :invitations
  has_many :users, through: :invitations
end
