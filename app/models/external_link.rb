class ExternalLink < ApplicationRecord
  default_scope { order('url_type ASC') }

  ALLOWED_URL_TYPES = %w(website facebook twitter instagram lastfm bandcamp soundcloud discogs).freeze

  belongs_to :artist

  validates :artist, presence: true
  validates :url, presence: true
  validates :url_type, inclusion: { in: ALLOWED_URL_TYPES }, presence: true

  def self.allowed_url_types
    ALLOWED_URL_TYPES
  end
end
