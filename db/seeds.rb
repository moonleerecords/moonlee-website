require 'csv'

# TODO: main image in admin is not working

if Rails.env == 'development'
  AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
end

importer = Import::Importer.new

importer.artists
importer.external_links
importer.members
importer.releases
importer.artists_releases
importer.releases_reviews
importer.releases_buy_links
importer.posts

# TODO: new slides

# Slides
Slide.create(
  title: 'Politika – a new album by Bernays Propaganda',
  image: File.new(Rails.root.join('lib', 'seeds', 'images', 'slides', 'bernays_propaganda_01.png')),
  url: '/artists/bernays-propaganda',
  records: true,
  position: 1
)
Slide.create(
  title: 'Repetitor on the tour',
  image: File.new(Rails.root.join('lib', 'seeds', 'images', 'slides', 'repetitor_01.png')),
  url: '/artists/repetitor',
  records: true,
  position: 2
)
Slide.create(
  title: 'Vlasta Popić touring Balkans',
  image: File.new(Rails.root.join('lib', 'seeds', 'images', 'slides', 'vlasta_popic_01.png')),
  url: '/artists/vlasta-popic',
  records: true,
  position: 3
)
Slide.create(
  title: 'Politika – a new album by Bernays Propaganda',
  image: File.new(Rails.root.join('lib', 'seeds', 'images', 'slides', 'bernays_propaganda_01.png')),
  url: '/artists/bernays-propaganda',
  booking: true,
  position: 1
)
Slide.create(
  title: 'Repetitor on the tour',
  image: File.new(Rails.root.join('lib', 'seeds', 'images', 'slides', 'repetitor_01.png')),
  url: '/artists/repetitor',
  booking: true,
  position: 2
)
