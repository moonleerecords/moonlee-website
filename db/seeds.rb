require 'csv'

# TODO: remove this before official release. be sure to drop database and add user by hand
# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
# TODO: main image in admin is not working
# TODO: add album types (cd, digital etc)

importer = Import::Importer.new

# importer.artists
# importer.releases
# importer.artist_releases
# importer.external_links
importer.members

# TODO: members, reviews

exit

# TODO: to importer
# dobrodosli_na_okean_cd = ReleaseType.create(
#   release: dobrodosli_na_okean,
#   release_format: 'cd'
# )
# dobrodosli_na_okean_lp = ReleaseType.create(
#   release: dobrodosli_na_okean,
#   release_format: 'lp'
# )
# dobrodosli_na_okean_digital = ReleaseType.create(
#   release: dobrodosli_na_okean,
#   release_format: 'digital'
# )
# ReleaseTypeMainBuyLink.create(
#   release_type: dobrodosli_na_okean_cd,
#   buy_url: 'http://store.moonleerecords.com/repetitor-dobrodosli-na-okean-cd.html'
# )
# ReleaseTypeMainBuyLink.create(
#   release_type: dobrodosli_na_okean_lp,
#   buy_url: 'http://store.moonleerecords.com/repetitor-dobrodosli-na-okean-12inch-vinyl.html'
# )
# ReleaseTypeOtherBuyLink.create(
#   title: 'Interpunk.com',
#   release_type: dobrodosli_na_okean_cd,
#   buy_url: 'http://interpunk.com/item.cfm?Item=208203'
# )
# ReleaseTypeMainBuyLink.create(
#   release_type: dobrodosli_na_okean_digital,
#   buy_url: 'https://moonleerecords.bandcamp.com/album/dobrodo-li-na-okean'
# )
# ReleaseTypeOtherBuyLink.create(
#   title: 'iTunes',
#   release_type: dobrodosli_na_okean_digital,
#   buy_url: 'https://itunes.apple.com/us/album/dobrodosli-na-okean/id583517090'
# )

# TODO: posts with introduction text

# Posts
Post.create(
  title: 'Politika – a new album by Bernays Propaganda',
  image: File.new(Rails.root.join('lib', 'seeds', 'images', 'posts', 'hmrl039-bernays-propaganda.jpg')),
  body: 'Macedonian activist musicians Bernays Propaganda have released their fourth album “Politika” today, March 14th 2016. Their new album, which sets an important milestone in band’s career, is released on the Slovenian independent label Moonlee Records available in the CD and LP formats, as well as a free download.',
  visibility: 'public',
  records: true,
  published_at: Time.new(2016, 03, 14, 11, 34, 00),
  tags: ['2016', 'bernays propaganda', 'cd', 'european', 'macedonia', 'moonlee', 'notwist', 'politika', 'tour', 'vinyl'],
  categories: ['news']
)

Post.create(
  title: 'Werefox announce new album! Watch video for "Triads" now!',
  image: File.new(Rails.root.join('lib', 'seeds', 'images', 'posts', 'hmrl040-werefox.jpg')),
  body: 'Werefox, an alternative rock four-piece from Slovenia, have shared the long-awaited video for the song “Triads” and announced the release of their sophomore album “Das Lied der Maschinen”, coming out on February 4th 2016 on Moonlee Records.',
  visibility: 'public',
  records: true,
  published_at: Time.new(2016, 01, 28, 11, 34, 00),
  tags: ['werefox', 'cd', 'release', 'triads', 'slovenia'],
  categories: ['news']
)

Post.create(
  title: 'Nikki Louder released "Trout"',
  image: File.new(Rails.root.join('lib', 'seeds', 'images', 'posts', 'hmrl038-nikki-louder.jpg')),
  body: 'Slovenian noise-rock trio Nikki Louder just released »Trout«, their fourth full-length, available both on CD and LP format and also as free download, which is result of cooperation between Moonlee Records and Založbe Radia Študent.',
  visibility: 'public',
  records: true,
  published_at: Time.new(2015, 12, 15, 11, 34, 00),
  tags: ['nikki louder', 'lp', 'vinyl', 'cd', 'slovenia'],
  categories: ['news']
)

# Slides
Slide.create(
  title: 'Politika – a new album by Bernays Propaganda',
  image: File.new(Rails.root.join('lib', 'seeds', 'images', 'slides', 'bernays_propaganda_001.png')),
  url: '/artists/bernays-propaganda',
  records: true,
  position: 1
)
Slide.create(
  title: 'Repetitor on the tour',
  image: File.new(Rails.root.join('lib', 'seeds', 'images', 'slides', 'repetitor_001.png')),
  url: '/artists/repetitor',
  records: true,
  position: 2
)
Slide.create(
  title: 'Vlasta Popić touring Balkans',
  image: File.new(Rails.root.join('lib', 'seeds', 'images', 'slides', 'vlasta_popic_001.png')),
  url: '/artists/vlasta-popic',
  records: true,
  position: 3
)
Slide.create(
  title: 'Politika – a new album by Bernays Propaganda',
  image: File.new(Rails.root.join('lib', 'seeds', 'images', 'slides', 'bernays_propaganda_001.png')),
  url: '/artists/bernays-propaganda',
  booking: true,
  position: 1
)
Slide.create(
  title: 'Repetitor on the tour',
  image: File.new(Rails.root.join('lib', 'seeds', 'images', 'slides', 'repetitor_001.png')),
  url: '/artists/repetitor',
  booking: true,
  position: 2
)

# TODO: news import from XML
# TODO: album cover, band photos etc
# TODO: short name for artist? "Debeli Precjednik / Fat Prezident" -> "Debeli Precjednik"