class Artist < ApplicationRecord
  has_many :artist_members, counter_cache: true, dependent: :destroy
  has_many :members, through: :artist_members
  has_many :external_links, dependent: :destroy
  has_many :artist_releases
  has_many :releases, through: :artist_releases

  validates :name, presence: true

  accepts_nested_attributes_for :artist_members, allow_destroy: true

  def to_s
    name
  end
  # TODO: has_many :events
  # TODO: images
end
