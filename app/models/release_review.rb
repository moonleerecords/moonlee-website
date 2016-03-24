class ReleaseReview < ApplicationRecord
  belongs_to :release

  validates :title, presence: true
  validates :url, presence: true
end
