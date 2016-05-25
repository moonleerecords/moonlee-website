class Release < ApplicationRecord
  # TODO: default sort, by release date, or code
  # TODO: for records, get just internal release

  has_many :release_types, dependent: :destroy
  has_many :release_reviews, dependent: :destroy
  has_many :artist_releases
  has_many :artists, through: :artist_releases

  accepts_nested_attributes_for :release_types, allow_destroy: true
  accepts_nested_attributes_for :release_reviews, allow_destroy: true

  validates :title, presence: true
  validates :catalog_number, presence: true
  validates :release_date, presence: true

  # release can be added, but maybe you don't want to show it on the frontend
  default_scope { where(active: true).order('release_date ASC') }
  scope :upcoming, -> { where('release_date > ?', Time.zone.today) }
  scope :fresh, -> { where('release_date <= ? AND release_date >= ?', Time.zone.today, Time.zone.today - 1.month) }
  scope :latest, -> { where('release_date <= ?', Time.zone.today) }
end
