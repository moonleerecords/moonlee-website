class ReleaseTypeOtherBuyLink < ApplicationRecord
  belongs_to :release_type

  validates :title, presence: true
  validates :buy_url, presence: true
end
