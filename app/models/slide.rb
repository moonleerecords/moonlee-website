class Slide < ApplicationRecord
  default_scope { order('position ASC') }

  # TODO: change styles
  # TODO: set proper default size
  has_attached_file :image, styles: { large: '300x300>', small: '100x100>' }, default_url: '/assets/missing.png'

  validates :image, presence: true
  validates :url, presence: true
  validates :position, presence: true

  validates_attachment_content_type :image, content_type: %r{\Aimage\/.*\Z}

  scope :on_records, -> { where(records: true) }
  scope :on_booking, -> { where(booking: true) }

  before_validation :assign_position

  private

  def assign_position
    self.position = 0 if position.nil?
  end
end
