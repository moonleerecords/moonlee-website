class ReleaseType < ApplicationRecord
  default_scope { order('position ASC') }

  ALLOWED_FORMATS = { 'cd' => 1, 'lp' => 2, '7inch' => 3, 'lp_cd' => 4, 'download' => 5, 'download_merch' => 6 }.stringify_keys.freeze

  belongs_to :release
  has_one :release_type_main_buy_link, dependent: :destroy
  has_many :release_type_other_buy_links, dependent: :destroy

  accepts_nested_attributes_for :release_type_main_buy_link, allow_destroy: true
  accepts_nested_attributes_for :release_type_other_buy_links, allow_destroy: true

  validates :release, presence: true
  validates :release_format, presence: true, inclusion: { in: ALLOWED_FORMATS.keys }

  before_save :assign_position

  def self.allowed_formats
    ALLOWED_FORMATS.keys
  end

  private

  def assign_position
    self.position = ALLOWED_FORMATS[release_format]
  end
end
