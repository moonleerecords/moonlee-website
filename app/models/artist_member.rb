class ArtistMember < ApplicationRecord
  belongs_to :artist
  belongs_to :member

  validates :artist, presence: true
  validates :member, presence: true
end
