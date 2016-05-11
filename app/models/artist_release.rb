class ArtistRelease < ApplicationRecord
  belongs_to :artist
  belongs_to :release
end
