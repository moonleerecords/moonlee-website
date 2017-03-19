class Slide < ApplicationRecord
  default_scope { order('position ASC') }

  has_attached_file :image,
                    styles: {
                      medium: '450x450>',
                      large: '1250x1250>'
                    }

  # TODO: deal with compression somehow
  # TODO: http://stackoverflow.com/questions/28412310/rails-paperclip-tinypng-gem
  # TODO: https://github.com/benmanns/tinypng

  validates :image, presence: true
  validates :url, presence: true
  validates :position, presence: true

  validates_attachment_content_type :image, content_type: %r{\Aimage\/.*\Z}

  scope :on_records, -> { where(active: true, records: true) }
  scope :on_booking, -> { where(active: true, booking: true) }

  before_validation :assign_position

  private

  def assign_position
    self.position = 0 if position.nil?
  end
end
