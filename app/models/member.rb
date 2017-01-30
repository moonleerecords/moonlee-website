class Member < ApplicationRecord
  has_many :artist_members
  has_many :artists, through: :artist_members

  validates :name, presence: true
end
