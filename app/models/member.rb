class Member < ApplicationRecord
  has_many :artists, through: :artist_members

  validates :name, presence: true
end
