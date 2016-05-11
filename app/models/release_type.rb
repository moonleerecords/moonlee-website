class ReleaseType < ApplicationRecord
  ALLOWED_FORMATS = %w(cd lp 7inch download lp_cd download_merch)

  belongs_to :release
  has_many :release_type_main_buy_links, dependent: :destroy
  has_many :release_type_other_buy_links, dependent: :destroy

  accepts_nested_attributes_for :release_type_main_buy_links, allow_destroy: true
  accepts_nested_attributes_for :release_type_other_buy_links, allow_destroy: true

  validates :release, presence: true
  validates :format, presence: true, inclusion: { in: ALLOWED_FORMATS }

  def self.allowed_formats
    ALLOWED_FORMATS
  end
end
