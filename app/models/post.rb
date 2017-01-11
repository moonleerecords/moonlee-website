class Post < ApplicationRecord
  VISIBILITY_OPTIONS = %w(public hidden).freeze
  AVAILABLE_CATEGORIES = %w(news).freeze

  extend FriendlyId
  include YoutubeVideo

  friendly_id :custom_slug, use: :slugged

  paginates_per 20

  default_scope { order('published_at DESC') }

  has_attached_file :image,
                    styles: {
                      large: '1250x1250>',
                      medium: '400x400#',
                      small: '100x100#'
                    }

  validates :title, presence: true
  validates :body, presence: true
  validates :published_at, presence: true
  validates :visibility, inclusion: { in: VISIBILITY_OPTIONS }
  validates :categories, length: { minimum: 1 }
  validate :validate_categories

  validates_attachment_content_type :image, content_type: %r{\Aimage\/.*\Z}

  scope :published, -> { where('published_at <= ?', Time.zone.now).where(visibility: 'public') }
  scope :on_records, -> { where(records: true) }
  scope :on_booking, -> { where(booking: true) }
  scope :hidden, -> { where(records: false, booking: false) }

  before_validation :assign_published_at
  before_save :assign_default_image

  def youtube_iframe(width = '560', height = '315')
    if self.youtube_video.present?
      youtube_video_id = youtube_video_id(self.youtube_video)
      "<iframe width='#{width}' height='#{height}' src='https://www.youtube.com/embed/#{youtube_video_id}?modestbranding=1&autohide=1&showinfo=0&controls=0' frameborder='0' allowfullscreen></iframe>"
    end
  end

  def body
    self[:body].gsub('&nbsp;', ' ')
  end

  def tags_raw
    tags.join(', ') unless tags.nil?
  end

  def tags_raw=(values)
    self.tags = values.split(',').map(&:strip)
  end

  def self.visibility_options
    VISIBILITY_OPTIONS
  end

  def self.available_categories
    AVAILABLE_CATEGORIES
  end

  private

  def custom_slug
    "#{published_at.strftime('%Y/%m/%d')} #{title}"
  end

  def assign_published_at
    self.published_at = created_at if published_at.nil?
  end

  def assign_default_image
    if self.youtube_video.present?
      youtube_video_id = youtube_video_id(self.youtube_video)
      self.image = open("https://img.youtube.com/vi/#{youtube_video_id}/0.jpg")
    end
  end

  def validate_categories
    categories = self.categories.reject! { |c| c.empty? }
    invalid_categories = Array(categories) - AVAILABLE_CATEGORIES
    errors.add(:categories, 'Not all the categories are valid') if invalid_categories.count > 0
  end
end
