# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

repetitor = Artist.create(
  name: 'Repetitor',
  description: "<p>For decades, throughout the Balkans and well beyond, Serbian capital Belgrade has been renowned for its creative and moving rock bands, who not only enjoyed great popularity during their heyday, but also became one of the fundamental carriers of contemporary culture. On this foundation today’s generation of musicians continue to seek for new musical expressions and as such comprise the Belgrade’s new rock scene.</p><p>One of the most prominent acts of this scene are Repetitor, founded in 2005 by Milena Milutinović (drums), Boris Vlastelica (guitar, vocals) and Ana-Marija Cupin (bass, vocals). They faithfully carved their signature sound, a blend of heavy rock’n’roll, post-punk and everything in between, and undoubtedly managed to raise the bar with their debut “Sve što vidim je prvi put” (Everything I See Is For The First Time), released by Odličan Hrčak in 2008. The album topped the charts, faced nothing less than extremely positive reviews, and regularly got pronounced as probably the most authentic and fresh album from the area in a long time. Needless to say, its successor has been much anticipated, and luckily the wait was shortened by numerous high-energy must-see live appearances, which are undoubtedly one of the band’s most powerful weapons of broadening the fan base.</p><p>And now, Moonlee Records proudly presents Repetitor‘s sophomore album, “Dobrodošli na okean“ (Welcome To The Ocean), a perfectly envisioned labour of love, diligently crafted over the years, and finally ready to unleash its groundbreaking energy and ingenuity. The album delivers nine tracks of cross-genre ecstasy, packed in a powerful, rocking-your-guts-out interplay of instruments, vocals and the distinctive wall of sound they create together. Attempts to find a direct musical influence may prove to be a difficult task, but an attentive listener will recognise similarities with variety of bands, from early Mudhoney, Šarlo Akrobata, Fugazi, Sonic Youth, Pixies and early Nirvana all the way to Black Sabbath or even Suicide. That may sound irreconcilable at first, but Repetitor does it with ease and brings a sonic experience that can hardly be more enjoyable. True rock to the core – with a completely twisted approach. The lyrics are in Serbian, mostly dealing with social topics, but presented in a less explicit manner through everyday situations. Possible incomprehensibility shouldn’t discourage you from listening, mainly because of the characteristic expression of Boris’ vocals.</p><p>“Dobrodošli na okean” was recorded by Primož Vozelj in Vrbas, Trbovlje and Ljubljana, and mixed by Goran Crevar in studio Digimedia in Belgrade during 2011 and 2012. Carl Saff mastered it in Chacago in October 2012, and Moonlee Records is set to release it on November 29th 2012 as a free download (name-your price), CD and LP in a rich, deluxe gatefold sleeve which will make the nice artwork by bass player Ana-Marija Cupin really stand out.</p><p>It’s no wonder Repetitor caught everybody’s attention early on, as they are a clear case of ideal people/place/time constellation, and we are thrilled to make Moonlee Records a part of it all. Perhaps it’s a bit too early, but not at all exaggerated to say that they are the ones who are now steadily becoming a part of some, yet unwritten chapter on rock history and culture from the region. Given the achieved recognition and the influence they already made, we can expect this sooner than later. “Dobrodošli na okean” only adds more meaning into this, and we hope that listening to the album will make you feel just like that.</p>",
  origin: 'Serbia',
  genre: "post-punk / alternative rock / rock'n'roll"
)

dobrodosli_na_okean = Release.create(
  title: 'Dobrodošli na Okean',
  catalog_number: 'HMRL028',
  release_date: Date.new(2012, 11, 29),
  description: "<p>Repetitor from Belgrade, Serbia, present their second album “Dobrodošli na okean“, a perfectly envisioned labour of love, diligently crafted over the years, and finally ready to unleash its groundbreaking energy and ingenuity. The album delivers nine tracks of cross-genre ecstasy, packed in a powerful, rocking-your-guts-out interplay of instruments, vocals and the distinctive wall of sound they create together. Attempts to find a direct musical influence may prove to be a difficult task, but an attentive listener will recognize similarities with variety of bands, from early Mudhoney, Šarlo Akrobata, Fugazi, Sonic Youth, Pixies and early Nirvana all the way to Black Sabbath or even Suicide. That may sound irreconcilable at first, but Repetitor does it with ease and brings a sonic experience that can hardly be more enjoyable. Heavy and high-energy blend of garage rock, post-punk and everything in between.</p>",
  tracklist: "1. Devojke idu u Minhen<br>2. Biću bolji<br>3. Šteta<br>4. U pravom trenutku<br>5. Dostupni i laki<br>6. Lica<br>7. Oktobarski salon<br>8. Laka zabava<br>9. Pripazi na ljude",
  for_fans_of: 'Obojeni Program, Ought, Metz',
  bandcamp_url: 'https://moonleerecords.bandcamp.com/album/dobrodo-li-na-okean',
  bandcamp_player: '<iframe style="border: 0; width: 100%; height: 120px;" src="https://bandcamp.com/EmbeddedPlayer/album=823079048/size=large/bgcol=333333/linkcol=0f91ff/tracklist=false/artwork=none/transparent=true/" seamless><a href="http://moonleerecords.bandcamp.com/album/dobrodo-li-na-okean">Dobrodošli na okean by REPETITOR</a></iframe>'
)

ArtistRelease.create(
  artist: repetitor,
  release: dobrodosli_na_okean
)

ReleaseReview.create(
  title: 'Some Will Never Know',
  url: 'http://www.swnk.org/reviews/repetitor-dobrodosli-na-okean/',
  quote: 'Even when you don’t understand a word, they know what a bit of good music sounds like.',
  rating: 80,
  max_rating: 100,
  language: 'English',
  visible: true
)

dobrodosli_na_okean_cd = ReleaseType.create(
  release: dobrodosli_na_okean,
  format: 'cd'
)

dobrodosli_na_okean_lp = ReleaseType.create(
  release: dobrodosli_na_okean,
  format: 'lp'
)

ReleaseTypeMainBuyLink.create(
  release_type: dobrodosli_na_okean_cd,
  buy_url: 'http://store.moonleerecords.com/repetitor-dobrodosli-na-okean-cd.html'
)

ReleaseTypeMainBuyLink.create(
  release_type: dobrodosli_na_okean_lp,
  buy_url: 'http://store.moonleerecords.com/repetitor-dobrodosli-na-okean-12inch-vinyl.html'
)

ReleaseTypeOtherBuyLink.create(
  release_type: dobrodosli_na_okean_cd,
  buy_url: 'http://interpunk.com/item.cfm?Item=208203'
)

# TODO: load additional content
# TODO: at some later point, replace with proper content
# TODO: album cover, band photos etc
