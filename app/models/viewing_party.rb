class ViewingParty < ApplicationRecord
  has_many :invitations
  has_many :users, through: :invitations

  validates :name, :start_time, :end_time, :movie_id, :movie_title, :host_id, presence: true

end
