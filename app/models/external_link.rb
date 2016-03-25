class ExternalLink < ApplicationRecord
  belongs_to :artist

  validates :artist, presence: true
  validates :url, presence: true
  validates :url_type, inclusion: { in: :allowed_url_types }

  def allowed_url_types
    ['website', 'facebook', 'twitter', 'lastfm', 'bandcamp', 'soundcloud', 'discogs']
  end
end
