class ReleaseReview < ApplicationRecord
  belongs_to :release

  validates :release, presence: true
  validates :title, presence: true
end
