class Event < ApplicationRecord
  belongs_to :artist
  belongs_to :venue

  validates :artist, presence: true
  validates :venue, presence: true
  validates :start_date, presence: true

  default_scope { where(active: true) }
  scope :upcoming, -> { where('start_date >= ?', Time.zone.today) }
end
