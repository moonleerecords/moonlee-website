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

# Slides
Slide.create(
  title: 'Repetitor released new album "Gde Ćeš"',
  image: File.new(Rails.root.join('lib', 'seeds', 'images', 'slides', 'repetitor_001.jpg')),
  url: '/artists/repetitor',
  records: true,
  position: 1
)
Slide.create(
  title: 'Debeli Precjednik / Mašinko split release out now!',
  image: File.new(Rails.root.join('lib', 'seeds', 'images', 'slides', 'debeli_precjednik_001.jpg')),
  url: '/artists/debeli-precjednik-fat-prezident',
  records: true,
  position: 2
)
Slide.create(
  title: 'Bernays Propaganda with new album "Politika"',
  image: File.new(Rails.root.join('lib', 'seeds', 'images', 'slides', 'bernays_propaganda_001.jpg')),
  url: '/artists/bernays-propaganda',
  records: true,
  position: 3
)

ActiveRecord::Base.connection.tables.each do |t|
  ActiveRecord::Base.connection.reset_pk_sequence!(t)
end
