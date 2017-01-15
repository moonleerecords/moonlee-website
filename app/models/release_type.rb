class ReleaseType < ApplicationRecord
  default_scope { order('position ASC') }

  FORMAT_CD = 'cd'.freeze
  FORMAT_LP = 'lp'.freeze
  FORMAT_7INCH = '7inch'.freeze
  FORMAT_10INCH = '10inch'.freeze
  FORMAT_LP_CD = 'lp_cd'.freeze
  FORMAT_DIGITAL = 'digital'.freeze
  FORMAT_DIGITAL_MERCH = 'digital_merch'.freeze

  ALLOWED_FORMATS = {
    FORMAT_CD => 1,
    FORMAT_LP => 2,
    FORMAT_7INCH => 3,
    FORMAT_10INCH => 4,
    FORMAT_LP_CD => 5,
    FORMAT_DIGITAL => 6,
    FORMAT_DIGITAL_MERCH => 7
  }.stringify_keys.freeze

  belongs_to :release
  has_many :release_type_buy_links, dependent: :destroy

  accepts_nested_attributes_for :release_type_buy_links, allow_destroy: true

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
