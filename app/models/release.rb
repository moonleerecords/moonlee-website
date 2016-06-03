class Release < ApplicationRecord
  has_many :release_types, dependent: :destroy
  has_many :release_reviews, dependent: :destroy
  has_many :artist_releases
  has_many :artists, through: :artist_releases

  accepts_nested_attributes_for :release_types, allow_destroy: true
  accepts_nested_attributes_for :release_reviews, allow_destroy: true

  # TODO: album cover
  # has_attached_file :image, styles: { medium: '300x300>', thumb: '100x100>' }, default_url: '/assets/missing.png'

  validates :title, presence: true
  validates :catalog_number, presence: true
  validates :release_date, presence: true

  # release can be added, but maybe you don't want to show it on the frontend
  default_scope { where(active: true).order('catalog_number ASC') }
  scope :internal, -> { where(internal: true) }
  scope :upcoming, -> { internal.where('release_date > ?', Time.zone.today) }
  scope :fresh, -> {
    internal.where(
      'release_date <= ? AND release_date >= ?',
      Time.zone.today,
      Time.zone.today - 1.month
    )
  }
  scope :latest, -> { internal.where('release_date <= ?', Time.zone.today) }
end
