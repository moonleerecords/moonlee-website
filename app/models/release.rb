class Release < ApplicationRecord
  # TODO: has_many :release_types
  # TODO: has_many :release_type_urls
  has_many :release_reviews

  validates :title, presence: true
  validates :catalog_number, presence: true
  validates :release_date, presence: true
end
