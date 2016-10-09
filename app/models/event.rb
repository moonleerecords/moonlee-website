class Event < ApplicationRecord
  default_scope { joins(:artist).order('start_date ASC, artists.name ASC') }

  belongs_to :artist
  belongs_to :venue

  validates :artist, presence: true
  validates :venue, presence: true
  validates :start_date, presence: true

  scope :upcoming, -> { where('start_date >= ?', Time.zone.today) }
  scope :on_records, -> { joins(:artist).where('artists.records', true) }
  scope :on_booking, -> { joins(:artist).where('artists.booking', true) }
end
