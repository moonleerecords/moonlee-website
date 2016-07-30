# TODO: update info, update info style
# TODO: add complete description
# TODO: update description style
# TODO: add images (check analena example)
# TODO: buy links, reviews etc.
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
# TODO: remove this before official release. be sure to drop database and add user by hand
# TODO: main image in admin is not working

# Analena
analena = Artist.create(
  name: 'Analena',
  image: File.new("#{Rails.root}/app/assets/images/base/artists/analena_01.jpg"),
  description: 'TODO',
  origin: 'Croatia, Slovenia',
  songkick_id: 399989,
  active: true,
  formed: '1997',
  records: true,
  booking: true,
  genre: 'post-punk / screamo / emo'
)
ExternalLink.create(
  artist: analena,
  url_type: 'lastfm',
  url: 'http://www.last.fm/music/Analena'
)
ExternalLink.create(
  artist: analena,
  url_type: 'bandcamp',
  url: 'https://analena.bandcamp.com/'
)
ExternalLink.create(
  artist: analena,
  url_type: 'facebook',
  url: 'https://www.facebook.com/ANALENA-6993242949'
)
ExternalLink.create(
  artist: analena,
  url_type: 'twitter',
  url: 'https://twitter.com/analenafire'
)
ExternalLink.create(
  artist: analena,
  url_type: 'discogs',
  url: 'https://www.discogs.com/artist/415253-Analena'
)
ana_franjic = Member.create(
  name: 'Ana Franjić'
)
miodrag_gladovic = Member.create(
  name: 'Miodrag Gladović'
)
miran_rusjan = Member.create(
  name: 'Miran Rusjan'
)
dubravko_dragojevic = Member.create(
  name: 'Dubravko Dragojević'
)
ArtistMember.create(
  artist: analena,
  member: ana_franjic,
  role: 'vocals, bass'
)
ArtistMember.create(
  artist: analena,
  member: miodrag_gladovic,
  role: 'guitar, back vocals'
)
ArtistMember.create(
  artist: analena,
  member: miran_rusjan,
  role: 'guitar, back vocals'
)
ArtistMember.create(
  artist: analena,
  member: dubravko_dragojevic,
  role: 'drums'
)
carbon_based = Release.create(
  title: 'Carbon Based',
  cover: File.new("#{Rails.root}/app/assets/images/base/releases/hmrl_001.jpg"),
  catalog_number: 'HMRL001',
  release_date: Date.new(2004, 11, 15),
  description: "In the case of ANALENA, one man’s hardcore is another man’s noise is another man’s punk. Diverse but steady, from bittersweet melodies and blistering hooks to pummeling and aggressive rhythms, ANALENA covers all the bases. Carbon Based is their’s second album, recorded and produced at Kozmo studio, Zagreb, by the members of the band themselves, with the noteworthy assistance provided by members of Lunar, another remarkable and friendly band from Zagreb. Carbon Based is a statement by a smart and mature band, an honest expression of determination and passion in full force. ANALENA follows its own instinct by merging charming melodies with intricate and shimmering rhythmic relentlessness. Stunning and flawless instrumentation combined with witty and poetic slogan-free lyrics takes care of the rest. See you in the pit or see you with your headphones on. You are invited. Until then, as the band itself proclaims in the moving Work In Progress: “Stay alert!”",
  tracklist: "1. Carbon Based Organisms<br>2. Dream Amplifiers<br>3. Work In Progress<br>4. Wiederholungszwang<br>5. Notturno<br>6. Spilt Milk<br>7. In Theory And Practice<br>8. From Automatic To Manual<br>9. Ropewalk Adventures<br>10. Rainy Night In Warsaw",
  bandcamp_url: 'https://moonleerecords.bandcamp.com/album/carbon-based',
  bandcamp_player: '<iframe style="border: 0; width: 100%; height: 120px;" src="https://bandcamp.com/EmbeddedPlayer/album=1343652965/size=large/bgcol=333333/linkcol=0f91ff/tracklist=false/artwork=none/transparent=true/" seamless><a href="http://moonleerecords.bandcamp.com/album/carbon-based">Carbon Based by ANALENA</a></iframe>',
  internal: true
)
ArtistRelease.create(
  artist: analena,
  release: carbon_based
)

# Bernays Propaganda
bernays_propaganda = Artist.create(
  name: 'Bernays Propaganda',
  image: File.new("#{Rails.root}/app/assets/images/base/artists/bernays_propaganda_01.jpg"),
  description: 'TODO: ',
  origin: 'Macedonia',
  songkick_id: 2459271,
  active: true,
  formed: '2007',
  records: true,
  booking: true,
  genre: 'post-punk / indie / alternative rock'
)
kristina_gorovska = Member.create(
  name: 'Kristina Gorovska'
)
vasko_atanasoski = Member.create(
  name: 'Vasko Atanasoski'
)
deni_krstev = Member.create(
  name: 'Deni Krstev'
)
ArtistMember.create(
  artist: bernays_propaganda,
  member: kristina_gorovska,
  role: 'vocals'
)
ArtistMember.create(
  artist: bernays_propaganda,
  member: vasko_atanasoski,
  role: 'guitar'
)
ArtistMember.create(
  artist: bernays_propaganda,
  member: deni_krstev,
  role: 'rhythm programming and synthesizer'
)
ExternalLink.create(
  artist: bernays_propaganda,
  url_type: 'lastfm',
  url: 'http://www.last.fm/music/Bernays+Propaganda'
)
ExternalLink.create(
  artist: bernays_propaganda,
  url_type: 'bandcamp',
  url: 'https://bernayspropaganda.bandcamp.com/'
)
ExternalLink.create(
  artist: bernays_propaganda,
  url_type: 'facebook',
  url: 'https://www.facebook.com/bernayspropaganda/'
)
ExternalLink.create(
  artist: bernays_propaganda,
  url_type: 'discogs',
  url: 'https://www.discogs.com/artist/1393536-Bernays-Propaganda'
)
politika = Release.create(
  title: 'Politika',
  cover: File.new("#{Rails.root}/app/assets/images/base/releases/hmrl_039.jpg"),
  catalog_number: 'HMRL039',
  release_date: Date.new(2016, 03, 14),
  description: "<p>The politically engaged Macedonian post-punk band Bernays Propaganda, one of the most hard working live acts and prolific alternative forces in the region, return with the new album “Politika”. Their fourth album in a row indicates a dramatic change in their sound that will surely surprise fans, both old and new!</p>",
  tracklist: "1. Politika<br>2. Armija<br>3. I dvete<br>4. Laži me, laži me<br>5. Jalova<br>6. Povekje<br>7. Ne sum vekje ubava<br>8. Sakav da se zaljubav<br>9. Politika II (kje dojde vreme)",
  for_fans_of: 'The Notwist, New Order, Handsome Furs',
  bandcamp_url: 'https://moonleerecords.bandcamp.com/album/politika',
  bandcamp_player: '<iframe style="border: 0; width: 100%; height: 120px;" src="https://bandcamp.com/EmbeddedPlayer/album=459661104/size=large/bgcol=dbdcdc/linkcol=3E813D/tracklist=false/artwork=small/transparent=true/" width="300" height="150" seamless=""><a href="http://moonleerecords.bandcamp.com/album/politika">Politika by BERNAYS PROPAGANDA</a></iframe>',
  internal: true
)
ArtistRelease.create(
  artist: bernays_propaganda,
  release: politika
)

# Damir Avdić
damir_avdic = Artist.create(
  name: 'Damir Avdić',
  image: File.new("#{Rails.root}/app/assets/images/base/artists/damir_avdic_01.jpg"),
  description: 'TODO',
  origin: 'Bosnia and Herzegovina',
  songkick_id: 3641561,
  active: true,
  records: true,
  booking: true,
  genre: 'hardcore / punk / blues'
)
ExternalLink.create(
  artist: damir_avdic,
  url_type: 'lastfm',
  url: 'http://www.last.fm/music/Damir+Avdi%C4%87'
)
ExternalLink.create(
  artist: damir_avdic,
  url_type: 'discogs',
  url: 'https://www.discogs.com/artist/1194965-Damir-Avdi%C4%87'
)
ExternalLink.create(
  artist: damir_avdic,
  url_type: 'bandcamp',
  url: 'https://damiravdic.bandcamp.com/'
)
damir_avdic_member = Member.create(
  name: 'Damir Avdić'
)
ArtistMember.create(
  artist: damir_avdic,
  member: damir_avdic_member,
  role: 'guitar, vocals'
)
zivot_je_raj = Release.create(
  title: 'Život je Raj',
  cover: File.new("#{Rails.root}/app/assets/images/base/releases/hmrl_019.jpg"),
  catalog_number: 'HMRL019',
  release_date: Date.new(2010, 05, 05),
  description: "<p>The third album by Damir Avdić was entirely created by Damir himself – if you liked “Mrtvi su mrtvi”, you already know that his songs don’t need the “basic” rock line-up to sound complete and full blooded in the punk manner. Penetrating voice and electric guitar so dense it fills every pore of silence are more than enough for Diplomatz to express himself and carve your brain with painful and bloody words which strip the skin and burn the flesh. And believe us when we tell you that these words say everything you hate and makes you nervous – and it’s so loud and clear that at first you won’t even know what hit you. That’s what Damir Avdić, Diplomatz of hardcore school really is – straightforward and serious with a very poisonous tongue – a modern anti-singer/songwriter who speaks about the world in a very special way.</p>",
  tracklist: "1. Kuda sestro<br>2. Umreži se<br>3. Život je raj<br>4. Svetac možda<br>5. Kakvo lijepo cvijeće raste<br>6. Imam dvadeset i dvije<br>7. Reci zlato<br>8. Tepaj mi<br>9. Gotovo je<br>10. Gdje si majko<br>11. Bratsvo i jedinstvo<br>12. Dođi dušo",
  bandcamp_url: 'https://moonleerecords.bandcamp.com/album/ivot-je-raj-2',
  bandcamp_player: '<iframe style="border: 0; width: 100%; height: 120px;" src="https://bandcamp.com/EmbeddedPlayer/album=3053604513/size=large/bgcol=dbdcdc/linkcol=3E813D/tracklist=false/artwork=small/transparent=true/" width="300" height="150" seamless=""><a href="http://moonleerecords.bandcamp.com/album/ivot-je-raj-2">Život je raj by DAMIR AVDIĆ</a></iframe>',
  internal: true
)
ArtistRelease.create(
  artist: damir_avdic,
  release: zivot_je_raj
)

# Repetitor
repetitor = Artist.create(
  name: 'Repetitor',
  image: File.new("#{Rails.root}/app/assets/images/base/artists/repetitor_01.jpg"),
  description: "<p>For decades, throughout the Balkans and well beyond, Serbian capital Belgrade has been renowned for its creative and moving rock bands, who not only enjoyed great popularity during their heyday, but also became one of the fundamental carriers of contemporary culture. On this foundation today’s generation of musicians continue to seek for new musical expressions and as such comprise the Belgrade’s new rock scene.</p><p>One of the most prominent acts of this scene are Repetitor, founded in 2005 by Milena Milutinović (drums), Boris Vlastelica (guitar, vocals) and Ana-Marija Cupin (bass, vocals). They faithfully carved their signature sound, a blend of heavy rock’n’roll, post-punk and everything in between, and undoubtedly managed to raise the bar with their debut “Sve što vidim je prvi put” (Everything I See Is For The First Time), released by Odličan Hrčak in 2008. The album topped the charts, faced nothing less than extremely positive reviews, and regularly got pronounced as probably the most authentic and fresh album from the area in a long time. Needless to say, its successor has been much anticipated, and luckily the wait was shortened by numerous high-energy must-see live appearances, which are undoubtedly one of the band’s most powerful weapons of broadening the fan base.</p><p>And now, Moonlee Records proudly presents Repetitor‘s sophomore album, “Dobrodošli na okean“ (Welcome To The Ocean), a perfectly envisioned labour of love, diligently crafted over the years, and finally ready to unleash its groundbreaking energy and ingenuity. The album delivers nine tracks of cross-genre ecstasy, packed in a powerful, rocking-your-guts-out interplay of instruments, vocals and the distinctive wall of sound they create together. Attempts to find a direct musical influence may prove to be a difficult task, but an attentive listener will recognise similarities with variety of bands, from early Mudhoney, Šarlo Akrobata, Fugazi, Sonic Youth, Pixies and early Nirvana all the way to Black Sabbath or even Suicide. That may sound irreconcilable at first, but Repetitor does it with ease and brings a sonic experience that can hardly be more enjoyable. True rock to the core – with a completely twisted approach. The lyrics are in Serbian, mostly dealing with social topics, but presented in a less explicit manner through everyday situations. Possible incomprehensibility shouldn’t discourage you from listening, mainly because of the characteristic expression of Boris’ vocals.</p><p>“Dobrodošli na okean” was recorded by Primož Vozelj in Vrbas, Trbovlje and Ljubljana, and mixed by Goran Crevar in studio Digimedia in Belgrade during 2011 and 2012. Carl Saff mastered it in Chacago in October 2012, and Moonlee Records is set to release it on November 29th 2012 as a free download (name-your price), CD and LP in a rich, deluxe gatefold sleeve which will make the nice artwork by bass player Ana-Marija Cupin really stand out.</p><p>It’s no wonder Repetitor caught everybody’s attention early on, as they are a clear case of ideal people/place/time constellation, and we are thrilled to make Moonlee Records a part of it all. Perhaps it’s a bit too early, but not at all exaggerated to say that they are the ones who are now steadily becoming a part of some, yet unwritten chapter on rock history and culture from the region. Given the achieved recognition and the influence they already made, we can expect this sooner than later. “Dobrodošli na okean” only adds more meaning into this, and we hope that listening to the album will make you feel just like that.</p>",
  origin: 'Serbia',
  songkick_id: 1956778,
  active: true,
  formed: '2005',
  records: true,
  booking: true,
  genre: "post-punk / alternative rock / rock'n'roll"
)
ExternalLink.create(
  artist: repetitor,
  url_type: 'lastfm',
  url: 'http://www.last.fm/music/Repetitor'
)
ExternalLink.create(
  artist: repetitor,
  url_type: 'bandcamp',
  url: 'https://repetitor.bandcamp.com/'
)
ExternalLink.create(
  artist: repetitor,
  url_type: 'twitter',
  url: 'https://twitter.com/repetitor_bg'
)
ExternalLink.create(
  artist: repetitor,
  url_type: 'facebook',
  url: 'https://www.facebook.com/repetitorbgd/'
)
ExternalLink.create(
  artist: repetitor,
  url_type: 'instagram',
  url: 'https://www.instagram.com/repetitor_bgd/'
)
ExternalLink.create(
  artist: repetitor,
  url_type: 'discogs',
  url: 'https://www.discogs.com/artist/1271681-Repetitor'
)
dobrodosli_na_okean = Release.create(
  title: 'Dobrodošli na Okean',
  cover: File.new("#{Rails.root}/app/assets/images/base/releases/hmrl_028.jpg"),
  catalog_number: 'HMRL028',
  release_date: Date.new(2012, 11, 29),
  description: "<p>Repetitor from Belgrade, Serbia, present their second album “Dobrodošli na okean“, a perfectly envisioned labour of love, diligently crafted over the years, and finally ready to unleash its groundbreaking energy and ingenuity. The album delivers nine tracks of cross-genre ecstasy, packed in a powerful, rocking-your-guts-out interplay of instruments, vocals and the distinctive wall of sound they create together. Attempts to find a direct musical influence may prove to be a difficult task, but an attentive listener will recognize similarities with variety of bands, from early Mudhoney, Šarlo Akrobata, Fugazi, Sonic Youth, Pixies and early Nirvana all the way to Black Sabbath or even Suicide. That may sound irreconcilable at first, but Repetitor does it with ease and brings a sonic experience that can hardly be more enjoyable. Heavy and high-energy blend of garage rock, post-punk and everything in between.</p>",
  tracklist: "1. Devojke idu u Minhen<br>2. Biću bolji<br>3. Šteta<br>4. U pravom trenutku<br>5. Dostupni i laki<br>6. Lica<br>7. Oktobarski salon<br>8. Laka zabava<br>9. Pripazi na ljude",
  for_fans_of: 'Obojeni Program, Ought, Metz',
  bandcamp_url: 'https://moonleerecords.bandcamp.com/album/dobrodo-li-na-okean',
  bandcamp_player: '<iframe style="border: 0; width: 100%; height: 120px;" src="https://bandcamp.com/EmbeddedPlayer/album=823079048/size=large/bgcol=333333/linkcol=0f91ff/tracklist=false/artwork=none/transparent=true/" seamless><a href="http://moonleerecords.bandcamp.com/album/dobrodo-li-na-okean">Dobrodošli na okean by REPETITOR</a></iframe>',
  internal: true
)
ArtistRelease.create(
  artist: repetitor,
  release: dobrodosli_na_okean
)
ReleaseReview.create(
  release: dobrodosli_na_okean,
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
  release_format: 'cd'
)
dobrodosli_na_okean_lp = ReleaseType.create(
  release: dobrodosli_na_okean,
  release_format: 'lp'
)
dobrodosli_na_okean_download = ReleaseType.create(
  release: dobrodosli_na_okean,
  release_format: 'download'
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
  title: 'Interpunk.com',
  release_type: dobrodosli_na_okean_cd,
  buy_url: 'http://interpunk.com/item.cfm?Item=208203'
)
ReleaseTypeMainBuyLink.create(
  release_type: dobrodosli_na_okean_download,
  buy_url: 'https://moonleerecords.bandcamp.com/album/dobrodo-li-na-okean'
)
ReleaseTypeOtherBuyLink.create(
  title: 'iTunes',
  release_type: dobrodosli_na_okean_download,
  buy_url: 'https://itunes.apple.com/us/album/dobrodosli-na-okean/id583517090'
)

# Xaxaxa
xaxaxa = Artist.create(
  name: 'Xaxaxa',
  image: File.new("#{Rails.root}/app/assets/images/base/artists/xaxaxa_01.jpg"),
  description: 'TODO: ',
  origin: 'Macedonia',
  active: false,
  formed: '2009',
  disbanded: '2015',
  records: true,
  booking: false,
  genre: 'punk rock / post-punk / indie'
)
ExternalLink.create(
  artist: xaxaxa,
  url_type: 'lastfm',
  url: 'http://www.last.fm/music/Xaxaxa'
)
ExternalLink.create(
  artist: xaxaxa,
  url_type: 'bandcamp',
  url: 'https://xaxaxa.bandcamp.com/'
)

# Posts
Post.create(
  title: 'Politika – a new album by Bernays Propaganda',
  body: 'Macedonian activist musicians Bernays Propaganda have released their fourth album “Politika” today, March 14th 2016. Their new album, which sets an important milestone in band’s career, is released on the Slovenian independent label Moonlee Records available in the CD and LP formats, as well as a free download.',
  visibility: 'public',
  records: true,
  published_at: Time.new(2016, 03, 14, 11, 34, 00),
  tags: ['2016', 'bernays propaganda', 'cd', 'european', 'macedonia', 'moonlee', 'notwist', 'politika', 'tour', 'vinyl'],
  categories: ['news']
)

# Slides
Slide.create(
  title: 'Politika – a new album by Bernays Propaganda',
  image: File.new("#{Rails.root}/db/data/images/slides/bernays_propaganda_01.png"),
  url: '/artists/bernays-propaganda',
  records: true,
  position: 1
)
Slide.create(
  title: 'Repetitor on the tour',
  image: File.new("#{Rails.root}/db/data/images/slides/repetitor_01.png"),
  url: '/artists/repetitor',
  records: true,
  position: 2
)
Slide.create(
  title: 'Vlasta Popić touring Balkans',
  image: File.new("#{Rails.root}/db/data/images/slides/vlasta_popic_01.png"),
  url: '/artists/vlasta-popic',
  records: true,
  position: 3
)
Slide.create(
  title: 'Politika – a new album by Bernays Propaganda',
  image: File.new("#{Rails.root}/db/data/images/slides/bernays_propaganda_01.png"),
  url: '/artists/bernays-propaganda',
  booking: true,
  position: 1
)
Slide.create(
  title: 'Repetitor on the tour',
  image: File.new("#{Rails.root}/db/data/images/slides/repetitor_01.png"),
  url: '/artists/repetitor',
  booking: true,
  position: 2
)

# TODO: news import from XML
# TODO: album cover, band photos etc
