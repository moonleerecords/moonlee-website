class Release < ApplicationRecord
  # TODO: default sort, by release date, or code
  # TODO: for records, get just internal release

  has_many :release_types, dependent: :destroy
  has_many :release_reviews, dependent: :destroy
  has_and_belongs_to_many :artists

  accepts_nested_attributes_for :release_types, allow_destroy: true
  accepts_nested_attributes_for :release_reviews, allow_destroy: true

  validates :title, presence: true
  validates :catalog_number, presence: true
  validates :release_date, presence: true
end
