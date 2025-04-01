class User < ApplicationRecord
  has_many :invitations
  has_many :viewing_parties, through: :invitations

  validates :name, presence: true
  validates :username, presence: true, uniqueness: true
  validates :password, presence: { require: true }
  
  has_secure_password
  has_secure_token :api_key

  def viewing_parties_hosted
    ViewingParty.where(host_id: id)
  end

  def viewing_parties_invited
    viewing_parties.where.not(host_id: id)
  end
end
