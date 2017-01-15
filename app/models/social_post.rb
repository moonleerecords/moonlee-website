class SocialPost < ApplicationRecord
  default_scope { order('source ASC, published_at DESC') }

  SOURCE_TWITTER = 'twitter'.freeze
  SOURCE_INSTAGRAM = 'instagram'.freeze
  SOURCE_YOUTUBE = 'youtube'.freeze
  SOURCES = [SOURCE_TWITTER, SOURCE_INSTAGRAM, SOURCE_YOUTUBE].freeze

  validates :source, inclusion: { in: SOURCES }, presence: true
  validates :url, presence: true
  validates :external_id, presence: true
  validates :published_at, presence: true
  validates :external_id, uniqueness: { scope: :source }

  scope :instagram, -> { where(source: SOURCE_INSTAGRAM) }
  scope :twitter, -> { where(source: SOURCE_TWITTER) }
  scope :youtube, -> { where(source: SOURCE_YOUTUBE) }

  def self.sources
    SOURCES
  end
end
