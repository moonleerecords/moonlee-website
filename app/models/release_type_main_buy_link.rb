class ReleaseTypeMainBuyLink < ApplicationRecord
  belongs_to :release_type

  validates :buy_url, presence: true
end
