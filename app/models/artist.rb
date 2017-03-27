class Artist < ApplicationRecord
  extend FriendlyId

  friendly_id :name, use: :slugged

  default_scope { order('artists.active DESC, artists.name ASC') }

  has_many :artist_members, counter_cache: true, dependent: :destroy
  has_many :members, through: :artist_members
  has_many :external_links, dependent: :destroy
  has_many :artist_releases
  has_many :releases, through: :artist_releases
  has_many :events

  has_attached_file :image,
                    styles: {
                      large: '1250x1250>',
                      large_medium: '700x700>',
                      medium: '450x450>',
                      small: '100x100>'
                    },
                    convert_options: {
                      # -strip -depth 8
                      all: ''
                    }

  # TODO: compressions
  # TODO: change image sizes?

  accepts_nested_attributes_for :artist_members, allow_destroy: true
  accepts_nested_attributes_for :external_links, allow_destroy: true

  validates :name, presence: true
  validates_attachment_content_type :image, content_type: %r{\Aimage\/.*\Z}

  scope :with_songkick_id, -> { where.not(songkick_id: nil) }
  scope :on_records, -> { where(records: true) }
  scope :on_booking, -> { where(booking: true) }
  scope :hidden, -> { where(records: false, booking: false) }
  scope :active, -> { where(active: true) }
  scope :inactive, -> { where(active: false) }

  def genre
    releases.each do |release|
      return release.genre unless release.split_release?
    end
    self[:genre]
  end
end
