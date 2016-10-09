class SocialPost < ApplicationRecord
  default_scope { order('source ASC, published_at DESC') }

  SOURCE_TWITTER = 'twitter'
  SOURCE_INSTAGRAM = 'instagram'
  SOURCE_YOUTUBE = 'youtube'
  SOURCES = [SOURCE_TWITTER, SOURCE_INSTAGRAM, SOURCE_YOUTUBE].freeze

  validates :source, inclusion: { in: SOURCES }, presence: true
  validates :link, presence: true
  validates :external_id, presence: true
  validates :published_at, presence: true
  validates_uniqueness_of :external_id, :scope => :source

  scope :youtube, -> { where(source: SOURCE_YOUTUBE) }
  scope :instagram, -> { where(source: SOURCE_INSTAGRAM) }

  def self.sources
    SOURCES
  end
end
