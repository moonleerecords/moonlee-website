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

  # TODO: change styles
  has_attached_file :cover, styles: { medium: '300x300>', small: '100x100>' }, default_url: '/assets/missing.png'

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

  def released_formats
    released_formats = []
    release_types.each do |release_type|
      released_formats << release_type.release_format
    end
    released_formats.join(' / ')
  end
end
