class ViewingParty < ApplicationRecord
  has_many :invitations
  has_many :users, through: :invitations

  validates :name, :start_time, :end_time, :movie_id, :movie_title, :host_id, presence: true
  validates :end_time, presence: true, comparison: {greater_than: :start_time}
  validate :valid_host_id?
  validate :end_time_after_start_time?

  def valid_host_id?
    unless User.exists?(id: host_id)
      errors.add(:host_id, "Must have a valid Host Id")
    end
  end
  
  def end_time_after_start_time?
    if start_time.present? && end_time.present? && end_time <= start_time
      errors.add(:end_time, "must be after start time")
    end
  end
end
