class ReleaseType < ApplicationRecord
  belongs_to :release

  validates :release, presence: true
  validates :format, presence: true, inclusion: { in: :allowed_formats }

  def allowed_formats
    %w(cd lp 7inch download lp_cd download_merch)
  end
end
