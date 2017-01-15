class ArtistMember < ApplicationRecord
  belongs_to :artist
  belongs_to :member

  validates :artist, presence: true
  validates :member, presence: true

  scope :active_members, -> { where(active: true) }
  scope :former_members, -> { where(active: false) }

  delegate :name, to: :member
end
