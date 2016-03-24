class ExternalLink < ApplicationRecord
  belongs_to :artist

  validates :artist, presence: true
  validates :url, presence: true
  validates :type, inclusion: { in: :types }

  def self.types
    ['website', 'facebook', 'twitter', 'lastfm', 'bandcamp', 'soundcloud', 'discogs']
  end
end
