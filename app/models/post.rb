class Post < ApplicationRecord
  VISIBILITY_OPTIONS = %w(public private).freeze
  AVAILABLE_CATEGORIES = %w(news).freeze

  extend FriendlyId
  friendly_id :custom_slug, use: :slugged

  default_scope { order('published_at ASC') }

  has_attached_file :image,
                    styles: {
                      large: '1250x1250>',
                      medium: '400x400>',
                      small: '100x100>'
                    },
                    default_url: '/assets/missing.png'

  validates :title, presence: true
  validates :body, presence: true
  validates :published_at, presence: true
  validates :visibility, inclusion: { in: VISIBILITY_OPTIONS }
  validates :categories, length: { minimum: 1 }
  validate :validate_categories

  validates_attachment_content_type :image, content_type: %r{\Aimage\/.*\Z}

  scope :on_records, -> { where('published_at <= ?', Time.zone.now).where(records: true) }
  scope :on_booking, -> { where('published_at <= ?', Time.zone.now).where(booking: true) }

  before_validation :assign_published_at

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

  def validate_categories
    invalid_categories = Array(categories) - AVAILABLE_CATEGORIES
    if invalid_categories.count > 0
      errors.add(:categories, 'Not all the categories are valid')
    end
  end
end
