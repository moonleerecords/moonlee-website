class Slide < ApplicationRecord
  default_scope { order('position ASC') }

  has_attached_file :image,
                    styles: {
                      medium: '450x450>',
                      large: '1250x1250>'
                    }

  # TODO: deal with compression
  # TODO: http://stackoverflow.com/questions/28412310/rails-paperclip-tinypng-gem
  # TODO: https://github.com/benmanns/tinypng

  validates :image, presence: true
  validates :url, presence: true
  validates :position, presence: true

  validates_attachment_content_type :image, content_type: %r{\Aimage\/.*\Z}

  scope :active, -> { where(active: true) }
  scope :on_records, -> { where(records: true) }
  scope :on_booking, -> { where(booking: true) }
  scope :hidden, -> { where(records: false, booking: false) }

  before_validation :assign_position, on: [:create]

  def self.update_positions(slides, drag_and_drop = false)
    if drag_and_drop
      slides.each_with_index do |id, index|
        update(id, position: index + 1)
      end
    else
      slides.each do |slide|
        slide.position += + 1
        slide.save
      end
    end
  end

  private

  def assign_position
    self.position = 1

    if records
      Slide.update_positions(Slide.on_records)
    elsif booking
      Slide.update_positions(Slide.on_booking)
    else
      Slide.update_positions(Slide.hidden)
    end
  end
end
