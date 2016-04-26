class ReleaseType < ApplicationRecord
  belongs_to :release

  validates :release, presence: true
  validates :format, presence: true, inclusion: { in: :allowed_formats }

  def allowed_formats
    # TODO: translations
    # cd - CD
    # lp - LP
    # 7inch - 7"
    # download - Download
    # lp_cd - LP + CD
    # download_and_merch - Download + Merch
    ['cd', 'lp', '7inch', 'download', 'lp_cd', 'download_merch']
  end
end
