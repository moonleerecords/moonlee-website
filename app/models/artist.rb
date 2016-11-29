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
  has_attached_file :image, styles: { medium: '300x300>', small: '100x100>' }, default_url: '/assets/missing.png'

  accepts_nested_attributes_for :artist_members, allow_destroy: true
  accepts_nested_attributes_for :external_links, allow_destroy: true

  validates :name, presence: true
  validates_attachment_content_type :image, content_type: %r{\Aimage\/.*\Z}

  scope :with_songkick_id, -> { where.not(songkick_id: nil) }
  scope :on_records, -> { where(records: true) }
  scope :on_booking, -> { where(booking: true) }

  # def to_s
  #   name
  # end
end
