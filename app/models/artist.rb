class Artist < ApplicationRecord
  extend FriendlyId

  friendly_id :name, use: :slugged

  default_scope { order('active DESC, name ASC') }

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

  # TODO: dualtone color input field
  # TODO: compressions


  accepts_nested_attributes_for :artist_members, allow_destroy: true
  accepts_nested_attributes_for :external_links, allow_destroy: true

  validates :name, presence: true
  validates_attachment_content_type :image, content_type: %r{\Aimage\/.*\Z}

  scope :with_songkick_id, -> { where.not(songkick_id: nil) }
  scope :on_records, -> { where(records: true) }
  scope :on_booking, -> { where(booking: true) }
  scope :active, -> { where(active: true) }
  scope :inactive, -> { where(active: false) }

  def artists_names(linked = false)
    if split_release?
      if linked
        self.artists.map do |artist|
          if artist.name.index('/')
            artist.name.slice(0..artist.name.index('/') - 1).strip
          else
            artist.name
          end
        end
      else
        concat_artists_names
        self.artists.pluck(:name).map! { |name| name.index('/') ? name.slice(0..name.index('/') - 1).strip : name }
      end
    end

    self.artists[0].name
  end

  def genre
    self.releases.each do |release|
      return release.genre unless release.split_release?
    end
    self[:genre]
  end
end
