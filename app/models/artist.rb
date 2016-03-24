class Artist < ApplicationRecord
  has_many :artist_members, counter_cache: true
  has_many :members, through: :artist_members
  has_many :artist_releases
  has_many :external_links

  validates :name, presence: true
  # TODO: has_many :events
  # TODO: images
end
