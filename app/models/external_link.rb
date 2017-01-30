class ExternalLink < ApplicationRecord
  default_scope { order('position ASC') }

  ALLOWED_URL_TYPES = {
    website: 1,
    facebook: 2,
    twitter: 3,
    instagram: 4,
    bandcamp: 5,
    spotify: 6,
    deezer: 7,
    google_music: 8,
    soundcloud: 9,
    lastfm: 10,
    discogs: 11
  }.stringify_keys.freeze

  belongs_to :artist

  validates :artist, presence: true
  validates :url, presence: true
  validates :url_type, inclusion: { in: ALLOWED_URL_TYPES.keys }, presence: true

  before_save :assign_position

  def self.allowed_url_types
    ALLOWED_URL_TYPES.keys
  end

  private

  def assign_position
    self.position = ALLOWED_URL_TYPES[release_format]
  end
end
