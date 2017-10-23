class Event < ApplicationRecord
  belongs_to :artist
  belongs_to :venue

  validates :artist, presence: true
  validates :venue, presence: true
  validates :start_date, presence: true

  scope :upcoming_per_artist, -> { where('start_date >= ?', Time.zone.today).order('artists.name ASC, start_date ASC') }
  scope :upcoming_per_date, -> { where('start_date >= ?', Time.zone.today).order('start_date ASC') }
  scope :on_records, -> { joins(:artist).where('artists.records', true) }
  scope :on_booking, -> { joins(:artist).where('artists.booking', true) }
end
