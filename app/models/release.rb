class Release < ApplicationRecord
  extend FriendlyId

  friendly_id :title, use: :slugged

  default_scope { where(active: true).order('catalog_number DESC') }

  has_many :release_types, dependent: :destroy
  has_many :release_reviews, dependent: :destroy
  has_many :artist_releases
  has_many :artists, through: :artist_releases

  accepts_nested_attributes_for :release_types, allow_destroy: true
  accepts_nested_attributes_for :release_reviews, allow_destroy: true

  has_attached_file :cover,
                    styles: { large: '1250x1250>', medium: '450x450>', small: '100x100>' },
                    default_url: '/assets/missing.png'

  # TODO: do this for cover image
  has_attached_file :cover_image,
                    styles: { large: '1250x1250>', medium: '450x450>', small: '100x100>' },
                    default_url: '/assets/missing.png'

  validates :title, presence: true
  validates :catalog_number, presence: true
  validates :release_date, presence: true
  validates_attachment_content_type :cover, content_type: %r{\Aimage\/.*\Z}

  scope :internal_releases, -> { where(internal: true) }
  scope :upcoming, -> { internal_releases.where('release_date > ?', Time.zone.today) }
  scope :fresh, lambda {
    internal_releases.where(
      'release_date <= ? AND release_date >= ?',
      Time.zone.today,
      Time.zone.today - 1.month
    )
  }
  scope :latest, -> { internal_releases.where('release_date <= ?', Time.zone.today) }

  before_save :generate_bandcamp_player

  def released_formats(separator = '/')
    released_formats = []
    release_types.each do |release_type|
      released_formats << release_type.release_format
    end
    released_formats.join(' #{separator} ')
  end

  def internal_buy_links
    internal_buy_links = {}
    release_types.each do |release_type|
      internal_buy_links[release_type.release_format] = release_type.release_type_buy_links.internal.first
    end
    internal_buy_links
  end

  def external_buy_links
    external_buy_links = {}
    release_types.each do |release_type|
      external_buy_links[release_type.release_format] = release_type.release_type_buy_links.internal.first
    end
    external_buy_links
  end

  def bandcamp_url_http
    uri = URI.parse(self.bandcamp_url)
    if uri.scheme == 'https'
      uri.scheme = 'http'
    end
    uri.to_s
  end

  private

  def generate_bandcamp_player
    self.bandcamp_player = "<iframe style=\"border: 0; width: 380px; height: 750px;\" src=\"https://bandcamp.com/EmbeddedPlayer/album=#{self.bandcamp_id}/size=large/bgcol=ffffff/linkcol=333333/transparent=true/\" seamless><a href=\"#{bandcamp_url_http}\"></a></iframe>"
  end
end
