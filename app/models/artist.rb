class Artist < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :artist_members, counter_cache: true, dependent: :destroy
  has_many :members, through: :artist_members
  has_many :external_links, dependent: :destroy
  has_many :artist_releases
  has_many :releases, through: :artist_releases
  has_many :events

  # TODO: change styles
  has_attached_file :image, styles: {medium: '300x300>', thumb: '100x100>'}, default_url: '/assets/missing.png'

  validates :name, presence: true
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  accepts_nested_attributes_for :artist_members, allow_destroy: true
  accepts_nested_attributes_for :external_links, allow_destroy: true

  scope :with_songkick_id, -> { where.not(songkick_id: nil) }
  scope :records, -> { where(records: true) }
  scope :booking, -> { where(booking: true) }

  def to_s
    name
  end
end
