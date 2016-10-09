class SocialPost < ApplicationRecord
  default_scope { order('created_at DESC') }

  SOURCE_TWITTER = 'twitter'
  SOURCE_INSTAGRAM = 'instagram'
  SOURCE_YOUTUBE = 'youtube'
  SOURCES = [SOURCE_TWITTER, SOURCE_INSTAGRAM, SOURCE_YOUTUBE].freeze

  validates :source, inclusion: { in: SOURCES }, presence: true
  validates :link, presence: true
  validates :external_id, presence: true
  validates_uniqueness_of :external_id, :scope => :source

  def self.sources
    SOURCES
  end
end
