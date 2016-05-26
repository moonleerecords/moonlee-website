class Venue < ApplicationRecord
  has_many :events

  validates :name, presence: true
  validates :city, presence: true
  validates :lng, presence: true
  validates :lat, presence: true
  validates :country_code, presence: true

  # TODO: get list of countries and country codes
  # TODO: automatically find lng/lat for self added events
end
