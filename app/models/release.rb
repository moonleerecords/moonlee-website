class Release < ApplicationRecord
  extend FriendlyId

  friendly_id :title, use: :slugged

  default_scope { where(active: true).order('catalog_number DESC') }

  has_many :release_types, dependent: :destroy
  has_many :release_reviews, dependent: :destroy
  has_many :artist_releases
  has_many :artists, through: :artist_releases
  has_many :external_links, as: :linkable, dependent: :destroy

  accepts_nested_attributes_for :release_types, allow_destroy: true
  accepts_nested_attributes_for :release_reviews, allow_destroy: true
  accepts_nested_attributes_for :external_links, allow_destroy: true

  has_attached_file :cover,
                    styles: {
                      large: '1250x1250',
                      medium: '450x450',
                      small: '100x100'
                    }

  # TODO: add attachment - pdf???

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

  before_save :generate_bandcamp_player, :assign_artists_names

  def released_formats(separator = '/')
    released_formats = []
    release_types.each do |release_type|
      released_formats << release_type.release_format
    end
    released_formats.join(" #{separator} ")
  end

  def internal_buy_links
    internal_buy_links = {}
    release_types.each do |release_type|
      buy_link = release_type.release_type_buy_links.internal.first
      internal_buy_links[release_type.release_format] = buy_link.try(:buy_url)
    end
    internal_buy_links
  end

  def external_buy_links
    external_buy_links = {}
    release_types.each do |release_type|
      buy_link = release_type.release_type_buy_links.internal.first
      external_buy_links[release_type.release_format] = buy_link.try(:buy_url)
    end
    external_buy_links
  end

  def bandcamp_url_http
    return nil unless bandcamp_url.present?
    uri = URI.parse(bandcamp_url)
    # TODO: get certificate and change this
    uri.scheme = 'http' if uri.scheme == 'https'
    uri.to_s
  end

  def concat_artists_names
    artists.pluck(:name).map! { |name| name.index('/') ? name.slice(0..name.index('/') - 1).strip : name }.join(' / ')
  end

  def split_release?
    artists.count > 1
  end

  private

  def generate_bandcamp_player
    self.bandcamp_player = "<iframe style=\"border: 0; width: 100%; height: 742px;\" src=\"https://bandcamp.com/EmbeddedPlayer/album=#{bandcamp_id}/size=large/bgcol=ffffff/linkcol=333333/transparent=true/\" seamless><a href=\"#{bandcamp_url_http}\"></a></iframe>" if bandcamp_url.present?
  end

  def assign_artists_names
    self.artists_names = if split_release?
                           concat_artists_names
                         else
                           artists[0].present? ? artists[0].name : ''
                         end
  end
end
