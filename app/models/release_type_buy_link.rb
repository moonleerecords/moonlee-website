class ReleaseTypeBuyLink < ApplicationRecord
  default_scope { order('source ASC') }

  belongs_to :release_type

  SOURCE_INTERNAL = 'internal'
  SOURCE_EXTERNAL = 'external'

  ALLOWED_SOURCES = [SOURCE_INTERNAL, SOURCE_EXTERNAL].freeze

  validates :source, inclusion: { in: ALLOWED_SOURCES }, presence: true
  validates :title, presence: true, if: :source_is_external?
  validates :buy_url, presence: true

  def source_is_external?
    self.source == 'external'
  end

  scope :internal, -> { where(source: SOURCE_INTERNAL)}
  scope :external, -> { where(source: SOURCE_EXTERNAL)}
end
