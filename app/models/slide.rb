class Slide < ApplicationRecord
  default_scope { order('position ASC') }

  has_attached_file :image,
                    styles: {
                      large: '1250x1250>'
                    },
                    default_url: '/assets/missing.png'

  # TODO: deal with compression somehow
  # TODO: http://stackoverflow.com/questions/28412310/rails-paperclip-tinypng-gem
  # TODO: https://github.com/benmanns/tinypng

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
