class Event < ApplicationRecord
  belongs_to :venue
  has_many :artist_events
  has_many :artists, through: :artist_event

  validates :venue, presence: true
  validates :start_date, presence: true

  scope :active, -> { where(active: true) }
end
